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

    end

    def search
      users = User.search(params[:q])
      render json: users
    end
  end
end
