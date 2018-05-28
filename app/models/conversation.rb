# frozen_string_literal: true

class Conversation < ApplicationRecord
  belongs_to :stage, optional: true

  has_many :user_conversations, dependent: :destroy
  has_many :users, through: :user_conversations

  has_many :messages
  has_many :uploads, through: :messages, source: :upload_attachment
end
