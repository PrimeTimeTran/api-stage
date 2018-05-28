class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    return object.first_name + ' ' + object.last_name if object.first_name && object.last_name
    ''
  end

  def most_recent_profile_photo
    if object.profile_photos.attached?
      object.profile_photos.last.service_url
    else
      'https://cdn1.iconfinder.com/data/icons/business-charts/512/customer-512.png'
    end
  end
end
