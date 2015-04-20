class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :photo_url, presence: true
  validates :rating, presence: true
  acts_as_commentable

  def like_count
    likes.count
  end
end
