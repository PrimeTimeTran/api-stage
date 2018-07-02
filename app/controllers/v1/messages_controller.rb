module V1
  class MessagesController < ApplicationController
    def index
      @messages = Conversation.find(params[:conversation_id]).messages.order('created_at DESC')
      render json: @messages
    end

    def create
      conversation = Conversation.find_by_id(params[:conversation_id])
      new_message_params = message_params.merge(user_id: @current_user.id)
      new_message_params[:upload_attributes][:user_id] = @current_user.id
      message =
        conversation
        .messages
        .create(new_message_params)
      render json: message
    end

    private

    def message_params
      params
        .require(:message)
        .permit([
          upload_attributes: [:media]
        ])
    end
  end
end
