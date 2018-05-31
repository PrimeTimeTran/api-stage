# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      token = request.params['token']
      user_id = JsonWebToken.decode(token)[:user_id]
      self.current_user = User.find(user_id)
      reject_unauthorized_connection unless current_user
    end
  end
end
