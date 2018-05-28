class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name, :profile_photo_url

  attribute :full_name do |obj|
    "#{obj.first_name} #{obj.last_name}"
  end

  attribute :profile_photo_url do |obj|
    obj.profile_photos.last.service_url.to_s
  end
end
