# frozen_string_literal: true

class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    token = JsonWebToken.encode(user_id: user.id) if user
    {
      token: token,
      user: user,
      message: Info.account_created
    }
  end

  def socket_call(token)
    JsonWebToken.decode(token)
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user&.valid_password?(password)
    raise(ExceptionHandler::AuthenticationError, Info.invalid_password)
  end
end
