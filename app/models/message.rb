# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, presence: true
  has_one :upload, as: :uploadable

  default_scope { order(created_at: 'DESC') }
end
