class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  prepend_view_path 'app/views/api/v1/'
  helper_method :current_user

  private
    def authorize_request
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) unless @current_user
      if @current_user
        @current_user ||= User.find(session[:user_id])
        @current_user.save(validate: false)
        cookies[:user_id] = @current_user.id || 'guest'
        @current_user
      end
    end

    def login(user)
      @current_user = User.find(user.id)
      session[:user_id] = user.id
    end

    def logout(_user)
      session[:user_id] = nil
    end
end
