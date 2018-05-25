class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_user

  prepend_view_path 'app/views/api/v1/'
  before_action :authorize_request, :set_session, except: [:fallback_index_html]

  def fallback_index_html
    render :file => 'public/index.html'
  end

  private
    def authorize_request
      @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end

    def set_session
      session[:user_id] = current_user.id
    end

    def login(user)
      @current_user = User.find(user.id)
      session[:user_id] = user.id
    end

    def logout(_user)
      session[:user_id] = nil
    end
end
