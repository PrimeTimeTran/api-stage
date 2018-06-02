# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, touch: true

  validates :body, presence: true
  has_one :upload, as: :uploadable
end
