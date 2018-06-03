# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    object.first_name && object.last_name ? "#{object.first_name} #{object.last_name}" : ''
  end

  def most_recent_profile_photo
    if object.uploads.present?
      object.uploads.select { |upload| upload.uploadable_type == 'ProfilePhoto' }.last.media.service_url
    else
      'https://cdn1.iconfinder.com/data/icons/business-charts/512/customer-512.png'
    end
  end
end
