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
end
