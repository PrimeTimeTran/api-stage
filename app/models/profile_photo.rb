class ProfilePhoto < ApplicationRecord
  belongs_to :user
  belongs_to :stage, optional: true
  has_many :comments, as: :commentable
  has_many :reactions, as: :reactionable
end
