# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id,
             :first_name,
             :last_name,
             :email,
             :city,
             :country,
             :occupation,
             :description,
             :age,
             :avatar_url,
             :full_name,
             :location,
             :uploads

  def full_name
    decorated.full_name
  end

  def location
    decorated.location
  end

  # def uploads
  #   decorated.profile_uploads
  # end

  def uploads
    photos = decorated.profile_uploads.map {|u| u.media }
    photos.map {|photo| { id: photo.id, url: url_for(photo)}}.reverse
  end
end
