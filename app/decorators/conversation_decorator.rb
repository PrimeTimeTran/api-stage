class ConversationDecorator < ApplicationDecorator
  delegate_all
  include Rails.application.routes.url_helpers
end
