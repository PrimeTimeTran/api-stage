class ConversationSerializer < ApplicationSerializer
  attributes :id

  has_many :users
  has_many :messages
end
