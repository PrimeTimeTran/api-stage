class UploadSerializer < ApplicationSerializer
  attributes :id, :url

  def url
    decorated.url
  end
end
