class Stage < ApplicationRecord
  has_many :user_conversations
  has_many :users, through: :user_conversations
  has_many :conversations, through: :user_conversations
end