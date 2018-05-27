# frozen_string_literal: true

class Stage < ApplicationRecord
  has_many :conversations
  has_many :users, through: :conversations

  has_many_attached :cover_photos
  has_many_attached :photos
end
