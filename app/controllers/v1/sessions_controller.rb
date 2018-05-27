# frozen_string_literal: true

module V1
  class SessionsController < ApplicationController
    def create
      if @current_user = User.find_by(email: session_params[:email])
        if @current_user.valid_password?(session_params[:password])
          login(@current_user)
        else
          head :unauthorized
        end
      end
    end

    private

    def session_params
      params.require(:user).permit(:email, :password)
    end
  end
end
