# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id, :profile_photo_url, :full_name

  def decorated
    object.decorate
  end

  def full_name
    decorated.full_name
  end

  def profile_photo_url
    decorated.most_recent_profile_photo
  end
end
