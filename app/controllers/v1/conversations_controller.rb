module V1
  class ConversationsController < ApplicationController
    def index
      @conversations = current_user.conversations.order(created_at: :desc)
      render json: @conversations
    end
  end
end