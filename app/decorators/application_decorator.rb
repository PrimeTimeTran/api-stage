# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  delegate_all
end
