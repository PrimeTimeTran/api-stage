# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id, :avatar_url, :full_name

  def full_name
    decorated.full_name
  end

  has_many :uploads
end
