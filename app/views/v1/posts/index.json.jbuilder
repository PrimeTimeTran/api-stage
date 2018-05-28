# frozen_string_literal: true

json.call(@posts) do |post|
  json.id post.id
  json.owner true if post.user_id == current_user.id
  json.created_at post.created_at
  json.body post.body
  json.image_url post.upload.service_url if post.upload.attached?
  json.user do
    user = post.user.decorate
    json.id user.id
    json.full_name user.full_name
    json.profile_photo_url url_for(user.most_recent_profile_photo)
  end
end
