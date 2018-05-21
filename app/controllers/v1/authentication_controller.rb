module V1
  class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :authenticate

    # return auth token once user is authenticated
    def authenticate
      puts "\n\n\n\n\n\n\n\n"
      puts "AuthenticationController:"
      puts auth_params
      puts params[:email]
      puts params[:password]
      puts "\n\n\n\n\n\n\n\n"
      auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      json_response(auth_token: auth_token)
    end

    private

    def auth_params
      params.permit(:email, :password)
    end
  end
end
