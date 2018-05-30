class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  def decorated
    @decorated_object ||= object.decorate
  end

  def owner?
    @owner ||= scope.id == object.user_id
  end

  def avatar_url
    if decorated.most_recent_profile_photo
      url_for(decorated.most_recent_profile_photo)
    end
  end
end
