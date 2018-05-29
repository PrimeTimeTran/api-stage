# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    return object.first_name + ' ' + object.last_name if object.first_name && object.last_name
    ''
  end

  def most_recent_profile_photo
    if object.uploads.present?
      photos = object.uploads.where.not('stage_id IS NOT null')
      photos.last.media.service_url
    else
      'https://cdn1.iconfinder.com/data/icons/business-charts/512/customer-512.png'
    end
  end
end
