# frozen_string_literal: true

class Conversation < ApplicationRecord
  belongs_to :stage, optional: true

  has_many :user_conversations, dependent: :destroy
  has_many :users, through: :user_conversations

  has_many :messages
  has_many :uploads, through: :messages, source: :upload

  default_scope { order(updated_at: 'DESC') }

  # TODO: need to search by message as well
  scope :search, -> (keyword) { where('name LIKE ?', "%#{keyword}%") }
end
