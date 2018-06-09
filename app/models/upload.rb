class Upload < ApplicationRecord
  belongs_to :user
  belongs_to :uploadable, polymorphic: true
  has_one_attached :media
  has_many :reactions, as: :reactionable
  has_many :comments, as: :commentable
  default_scope { order(created_at: 'ASC') }
end
