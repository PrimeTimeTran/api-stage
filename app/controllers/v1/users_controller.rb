# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    # POST /signup
    # return authenticated token upon signup
    def create
      user = User.create!(user_params)
      response = AuthenticateUser.new(user.email, user.password).call
      json_response(response.to_json)
    end

    private

    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
