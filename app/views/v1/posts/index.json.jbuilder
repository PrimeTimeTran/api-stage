# frozen_string_literal: true

json.call(@posts) do |post|
  post = post.decorate
  json.id post.id
  json.owner true if post.user_id == current_user.id
  json.created_at post.created_at
  json.body post.body
  json.image_url post.first.uploads.first.media.service_url if post.uploads.present?
  json.user do
    user = post.user.decorate
    json.id user.id
    json.full_name user.full_name
    json.profile_photo_url url_for(user.most_recent_profile_photo)
  end
  json.reactions do
    json.total post.reactions_count
    json.likes post.likes_count
    json.hearts post.hearts_count
    json.wows post.wows_count
    json.laughs post.laughs_count
    json.sads post.sads_count
  end
end
