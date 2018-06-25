module V1
  class FriendshipsController < ApplicationController
    def index
      friends = current_user.friends
      render json: friends, without_uploads: true
    end
  end
end
