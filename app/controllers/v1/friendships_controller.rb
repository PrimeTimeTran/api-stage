module V1
  class FriendshipsController < ApplicationController
    def index
      friends = current_user.friends
      # Could you help me remove an association from the serialization here? Don't need uploads
      # render json: ActiveModel::Serializer::CollectionSerializer.new(friends, each_serializer: UserSerializer, except: [:uploads])
      # render json: ActiveModel::Serializer::CollectionSerializer.new(friends, serializer: UserSerializer, except: [:uploads])
      # render json: ActiveModel::Serializer::CollectionSerializer.new(friends, serializer: UserSerializer)
      render json: friends, without_uploads: true
    end
  end
end
