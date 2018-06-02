module Roles
  module Uploadable
    def url
      if upload.present?
        upload.media.service_url
      else
        ''
      end
    end
  end
end