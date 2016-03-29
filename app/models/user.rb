class User < ActiveRecord::Base
  include Gravtastic
  is_gravtastic!

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :friendships
  has_many :friends, -> { where(friendships: {status: 'accepted' }) },
           through: :friendships
  has_many :requested_friends, -> { where(friendships: {status: 'requested' }) },
           through: :friendships, 
           source: :friend
  has_many :pending_friends, -> { where(friendships: {status: 'pending' }) },
           through: :friendships, 
           source: :friend
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post


  def already_likes?(post)
    !self.likes.find_by(post_id: post.id).nil?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.email = data["name"] if user.name.blank? 
      end
    end
  end
end
