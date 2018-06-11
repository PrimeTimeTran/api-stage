module V1
  class ConversationsController < ApplicationController
    def index
      conversations = current_user.conversations
      render json: conversations
    end

    def users
      users = Conversation.find(params[:id]).users
      render json: users
    end
  end
end