class Post < ApplicationRecord
  include Commentable

  belongs_to :user
  validates_presence_of :body
  has_one_attached :upload
end
