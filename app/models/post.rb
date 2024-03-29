# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :reactions, as: :reactionable

  validates_presence_of :body
  has_many :uploads, as: :uploadable, dependent: :destroy

  default_scope { order(created_at: 'DESC') }
end
