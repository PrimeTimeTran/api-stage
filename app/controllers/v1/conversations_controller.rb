module V1
  class ConversationsController < ApplicationController
    def index
      @conversations = current_user.conversations
      render json: @conversations
    end
  end
end