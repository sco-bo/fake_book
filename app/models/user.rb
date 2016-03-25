class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post


  def already_likes?(post)
    !self.likes.find_by(post_id: post.id).nil?
  end
end
