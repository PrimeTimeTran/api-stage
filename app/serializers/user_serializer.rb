# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id,
             :first_name,
             :last_name,
             :city,
             :country,
             :occupation,
             :description,
             :age,
             :avatar_url,
             :full_name,
             :location,
             :uploads,
             :email

  def full_name
    decorated.full_name
  end

  def location
    decorated.location
  end

  def email
    return nil if instance_options[:without_email]
    decorated.email
  end

  def uploads
    return [] if instance_options[:without_uploads]
    photos = decorated.profile_uploads.map {|u| u.media }
    photos.map {|photo| { id: photo.id, url: url_for(photo)}}
  end
end
