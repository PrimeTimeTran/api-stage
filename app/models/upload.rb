class Upload < ApplicationRecord
  belongs_to :user
  has_one_attached :media
  belongs_to :uploadable, polymorphic: true
end
