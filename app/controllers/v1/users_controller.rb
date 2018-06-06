# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      UserBuilder.new(params[:email], params[:password]) unless User.find_by(email: params[:email])
      response = AuthenticateUser.new(params[:email], params[:password]).call
      json_response(response.to_json)
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end
  end
end
