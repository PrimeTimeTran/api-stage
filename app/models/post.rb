class Post < ApplicationRecord
  include Commentable

  belongs_to :user
  validates_presence_of :body
end
