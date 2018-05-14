module V1
  class SessionsController < ApplicationController
    def create
      if @current_user = User.find_by(email: session_params[:email])
        # Email found
        if @current_user.valid_password?(session_params[:password])
          login(@current_user)
        else
          head :unauthorized
        end
      else
        # Email not found


        # binding.pry
        # @current_user = User.create!(email: session_params[:email], password: session_params[:password], password_confirmation: session_params[:password])
        # @current_user
      end
    end

    private
      def session_params
        params.require(:user).permit(:email, :password)
      end
  end
end
