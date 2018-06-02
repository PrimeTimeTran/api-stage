class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ChatChannel'
  end

  def unsubscribed
  end

  def perform
  end

  def send_message(payload)
    m = current_user.messages.create(conversation_id: payload['message']['conversation_id'], body: payload['message']['body'])
    data = MessageSerializer.new(m)
    ActionCable.server.broadcast('ChatChannel', data.to_json)
  end
end
