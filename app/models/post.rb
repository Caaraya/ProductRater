class Post < ActiveRecord::Base
belongs_to :user
validates :photo_url, presence: true
validates :rating, presence: true
acts_as_commentable
end
