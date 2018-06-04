class CommentDecorator < ApplicationDecorator
  include Rails.application.routes.url_helpers
  include Roles::Reactionable
  include Roles::Uploadable

  delegate_all
end
