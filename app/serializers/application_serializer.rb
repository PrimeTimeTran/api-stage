class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'localhost:3001'

  def decorated
    @decorated_object ||= object.decorate
  end

  def owner?
    @owner ||= scope.id == object.user_id
  end
end