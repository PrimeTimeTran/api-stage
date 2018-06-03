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
      @avatar_url ||= url_for(decorated.most_recent_profile_photo)
    end
  end

  def time(a)
    return a.strftime('%I:%M %p') if a > 1.day.ago
    return a.strftime('%a') if a > 7.days.ago
    a.strftime('%m-%d')
  end
end
