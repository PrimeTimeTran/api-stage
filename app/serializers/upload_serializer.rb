class UploadSerializer < ApplicationSerializer
  attributes :id, :url, :media_type

  def url
    decorated.url
  end
end
