# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      email = params[:email]
      password = params[:password]

      if User.find_by(email: email)&.valid_password?(password)
        response = AuthenticateUser.new(email, password).call
      else
        user = UserBuilder.new(email, password).user
        response = AuthenticateUser.new(user.email, user.password).call
      end
      json_response(response.to_json)
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end
  end
end
