json.(@posts) do |post|
  json.user post.user
  json.body post.body
end