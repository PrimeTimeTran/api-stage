class ConversationBuilder
  attr_reader :conversation

  def initialize(current_user_id, other_user_id)
    @conversation = Conversation.create!
    uc = User.find(current_user_id).user_conversations.new
    uc.conversation_id = @conversation.id
    uc.save
    uc = User.find(other_user_id).user_conversations.new
    uc.conversation_id = @conversation.id
    uc.save
    @conversation
  end
end