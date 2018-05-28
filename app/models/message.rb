# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, presence: true
  has_one_attached :upload

  default_scope { order(created_at: 'DESC') }
end
