# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      email = params[:email].downcase
      UserBuilder.new(email, params[:password]) unless User.find_by(email: email)
      response = AuthenticateUser.new(email, params[:password]).call
      json_response(response.to_json)
    end

    def show
      user = User.find(params[:id])
      render json: user
    end

    def update
      user = User.find(params[:id])
      if user.update!(user_params)
        render json: user
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def search
      users = User.search(params[:q])
      render json: users
    end

    private
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :city,
        :country,
        :occupation,
        :description,
        :age,
        :phone_number
      )
    end
  end
end
