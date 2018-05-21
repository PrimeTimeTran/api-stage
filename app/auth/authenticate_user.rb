class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    puts "\n\n\n\n\n\n\n\n"
    puts "AuthenticateUser.rb"
    puts user
    puts "\n\n\n\n\n\n\n\n"
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user && user.valid_password?(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Info.invalid_credentials)
  end
end