# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    # POST /signup
    # return authenticated token upon signup
    def create
      user = User.create!(email: params[:email],
                          password: params[:password],
                          password_confirmation: params[:password],
                          first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name)
      response = AuthenticateUser.new(user.email, user.password).call
      json_response(response.to_json)
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
