class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :commenting_users, through: :comments, source: :user
  mount_uploader :photo, PhotoUploader

  validate :photo_size

  private
  
    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be smaller than 5mb")
      end
    end
end
