class UploadSerializer < ApplicationSerializer
  attributes :id, :url

  def decorated
    object.decorate
  end

  def url
    decorated.url
  end
end
