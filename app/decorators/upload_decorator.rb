class UploadDecorator < ApplicationDecorator
  delegate_all

  def url
    object.media.service_url
  end
end
