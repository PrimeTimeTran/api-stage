json.(@posts) do |post|
  json.id post.id
  json.created_at post.created_at
  json.user post.user
  json.body post.body
end