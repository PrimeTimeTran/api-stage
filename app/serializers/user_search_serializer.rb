# frozen_string_literal: true

class UserSearchSerializer < ApplicationSerializer
  attributes :id, :full_name, :location, :avatar_url

  def full_name
    decorated.full_name
  end

  def location
    'Ho Chi Minh City'
  end
end

# ActiveModel::Serializer::CollectionSerializer.new(@users, serializer: UserSearchSerializer).to_json