# frozen_string_literal: true

json.call(@posts) do |post|
  json.id post.id
  json.owner true if post.user_id == current_user.id
  json.created_at post.created_at
  json.body post.body
  json.image_url post.upload.service_url if post.upload.attached?
  json.user do
    user = post.user.decorate
    url = 'https://cdn1.iconfinder.com/data/icons/business-charts/512/customer-512.png'
    json.id user.id
    json.full_name user.full_name
    if user.profile_photos.attached?
      json.profile_photo_url user.profile_photos.last.service_url
    else
      json.profile_photo_url url
    end
  end
end
