# frozen_string_literal: true

class Stage < ApplicationRecord
  has_many :conversations
  has_many :users, through: :conversations

  has_many :uploads, as: :uploadable
  has_many :profile_photos
end
