class Post < ActiveRecord::Base
  belongs_to :user
  # we need to specify what happens to `Likes` when a `Post` is destroyed --
  # that's why `mark as spam` didn't work at first
  has_many :likes, dependent: :destroy
  validates :photo_url, presence: true
  validates :rating, presence: true
  acts_as_commentable

  def like_count
    likes.count
  end
end
