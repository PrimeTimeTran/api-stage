module V1
  class ConversationsController < ApplicationController
    def index
      conversations = current_user.conversations.eager_load(:messages, :users)
      render json: conversations
    end

    def users
      users = Conversation.find(params[:id]).users
      render json: users
    end

    def show
      conversation = Conversation.find(params[:id])
      user_count = conversation.users.count
      stage_name = conversation.name

      render json: {
        user_count: user_count,
        stage_name: stage_name
      }
    end
  end
end