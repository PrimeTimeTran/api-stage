module V1
  class MessagesController < ApplicationController
    def index
      @messages = Conversation.find(params[:conversation_id]).messages.order('created_at DESC')
      render json: @messages
    end
  end
end