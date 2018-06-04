module V1
  class ConversationsController < ApplicationController
    def index
      @conversations = current_user.conversations.limit(3)
      render json: @conversations
    end
  end
end