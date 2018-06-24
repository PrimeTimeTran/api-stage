module V1
  class FriendshipsController < ApplicationController
    def index
      friends = current_user.friends
      render json: ActiveModel::Serializer::CollectionSerializer.new(friends, each_serializer: UserSerializer, except: [:uploads])
    end
  end
end