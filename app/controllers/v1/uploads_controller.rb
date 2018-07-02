# frozen_string_literal: true

module V1
  class UploadsController < ApplicationController
    skip_before_action :authorize_request, only: [:create]

    def create
      current_user = User.find(params[:userId])
      image = params[:photo]
      upload = current_user.uploads.create(uploadable_type: ProfilePhoto, uploadable_id: current_user.id, media_type: 'img')
      upload.media.attach(image)
    end

    def index
      render json: current_user.decorate.profile_uploads
    end

    def destroy
      params['uploadIds'].each { |id| Upload.find(id).destroy }
      render json: current_user.decorate.profile_uploads
    end

    def show
      photo = current_user.decorate.most_recent_profile_photo
      render json: {
        most_recent_profile_photo_url: photo
      }
    end
  end
end
