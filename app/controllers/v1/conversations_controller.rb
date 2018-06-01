module V1
  class ConversationsController < ApplicationController
    def index
      @conversations = current_user.conversations
    end
  end
end