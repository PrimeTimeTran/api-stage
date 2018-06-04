class UploadDecorator < ApplicationDecorator
  delegate_all

  include Rails.application.routes.url_helpers

  def url
    url_for(object.media) || null
  end
end
