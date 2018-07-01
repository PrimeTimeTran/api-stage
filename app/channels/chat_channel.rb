class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ChatChannel'
  end

  def unsubscribed
  end

  def perform
  end

  def send_message(payload)
    m = current_user.messages.create(
      conversation_id: payload['data']['conversation_id'],
      body: payload['data']['body'],
      upload_s3_location: payload['data']['upload_s3_location']
    )
    data = MessageSerializer.new(m).to_json
    ActionCable.server.broadcast('ChatChannel', data)
  end
end
