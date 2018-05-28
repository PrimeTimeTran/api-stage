# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :body
  has_one_attached :upload
  has_many :comments, as: :commentable
  has_many :reactions, as: :reactionable
end
