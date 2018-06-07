# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id,
             :avatar_url,
             :first_name,
             :full_name,
             :location,
             :occupation,
             :uploads

  def full_name
    decorated.full_name
  end

  def location
    decorated.location
  end

  def uploads
    decorated.profile_uploads
  end
end
