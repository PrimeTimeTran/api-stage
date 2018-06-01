class ConversationSerializer < ApplicationSerializer
  attributes :id, :messages
  has_many :users

end
