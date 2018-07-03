# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  delegate_all

  def time(a)
    return a.strftime('%I:%M %p') if a > 1.day.ago
    return a.strftime('%a') if a > 7.days.ago
    a.strftime('%m-%d')
  end
end
