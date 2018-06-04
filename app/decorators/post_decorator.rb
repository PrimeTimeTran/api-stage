class PostDecorator < ApplicationDecorator
  delegate_all
  include Roles::Reactionable
  include Roles::Uploadable
  include Rails.application.routes.url_helpers
end
