# frozen_string_literal: true

module V1
  class UploadsController < ApplicationController
    def create
      image = params[:data]["_parts"].first
      upload = current_user.uploads.create(uploadable_type: ProfilePhoto, uploadable_id: current_user.id, media_type: 'img')
      upload.media.attach(
        io: File.open(image),
        filename: 'ProfilePhoto.jpg',
        content_type: 'application/jpg'
      )
    end
  end
end
