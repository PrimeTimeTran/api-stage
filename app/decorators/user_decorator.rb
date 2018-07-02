# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    object.first_name && object.last_name ? "#{object.first_name} #{object.last_name}" : ''
  end

  def location
    "#{object.city}, #{object.country}"
  end

  def profile_uploads
    object.uploads.where(stage_id: nil).reverse
  end

  def most_recent_profile_photo
    if object.uploads.present?
      url_for(object.uploads.where(stage_id: nil).select { |upload| upload.uploadable_type == 'ProfilePhoto' }.last.media)
    else
      'https://cdn1.iconfinder.com/data/icons/business-charts/512/customer-512.png'
    end
  end
end
