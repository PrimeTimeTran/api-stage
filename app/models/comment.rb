# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :reactions, as: :reactionable
  has_many :uploads, as: :uploadable
end