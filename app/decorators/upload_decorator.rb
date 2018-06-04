class UploadDecorator < ApplicationDecorator
  delegate_all

  def url
    url_for(object.media) || null
  end
end
