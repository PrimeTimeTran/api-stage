# frozen_string_literal: true

class Stage < ApplicationRecord
  validates :name, presence: true
  has_many :conversations
  has_many :users, through: :conversations

  has_many :uploads, as: :uploadable
  has_many :profile_photos
end
