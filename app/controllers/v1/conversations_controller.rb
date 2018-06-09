module V1
  class ConversationsController < ApplicationController
    def index
      @conversations = current_user.conversations.first(2)
      render json: @conversations
    end
  end
end