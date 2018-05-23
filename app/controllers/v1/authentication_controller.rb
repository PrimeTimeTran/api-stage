module V1
  class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :authenticate

    # return auth token once user is authenticated
    def authenticate

      puts "\n\n\n\n\n\n\n\n"
      puts "Authentication#authenticate"
      puts "Email:"
      puts auth_params[:email]
      puts "\n"
      puts auth_params[:password]
      puts "\n\n\n\n\n\n\n\n"
      response =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      json_response(response.to_json)
    end

    private

    def auth_params
      params.permit(:email, :password)
    end
  end
end
