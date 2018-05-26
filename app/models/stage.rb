class Stage < ApplicationRecord
  has_many :conversations
  has_many :users, through: :conversations

  has_one_attached :cover_photo
  has_many_attached :photos
end
