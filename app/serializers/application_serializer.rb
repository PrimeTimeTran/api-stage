class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'lit-brushlands-65490.herokuapp.com'

  def decorated
    @decorated_object ||= object.decorate
  end

  def owner?
    @owner ||= scope.id == object.user_id
  end
end