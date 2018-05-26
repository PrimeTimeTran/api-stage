class Conversation < ApplicationRecord
  belongs_to :stage, optional: true

  has_many :user_conversations, dependent: :destroy
  has_many :users, through: :user_conversations

  has_many :messages
end
