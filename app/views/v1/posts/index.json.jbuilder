json.(@posts) do |post|
  json.id post.id
  json.owner true if post.user_id == current_user.id
  json.created_at post.created_at
  json.user post.user
  json.body post.body
  json.image_url post.upload.service_url if post.upload.attached?
end