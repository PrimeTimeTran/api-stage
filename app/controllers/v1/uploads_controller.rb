# frozen_string_literal: true

module V1
  class UploadsController < ApplicationController
    skip_before_action :authorize_request, only: [:create]

    def create
      image = params[:photo]
      upload = current_user.uploads.create(uploadable_type: ProfilePhoto, uploadable_id: current_user.id, media_type: 'img')
      upload.media.attach(image)
    end
  end
end
