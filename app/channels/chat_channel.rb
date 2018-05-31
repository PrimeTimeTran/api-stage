class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'ChatChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def perform
    # message = Message.new(author: current_user, text: payload["message"])
  end

  def send_message
    binding.pry

  end
end
