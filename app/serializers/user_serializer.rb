# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id,
             :avatar_url,
             :first_name,
             :full_name,
             :location,
             :occupation
  has_many :uploads

  def full_name
    decorated.full_name
  end

  def location
    decorated.location
  end
end
