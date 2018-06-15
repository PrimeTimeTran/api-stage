# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :get_paging_params

  prepend_view_path 'app/views/api/v1/'
  before_action :authorize_request, except: [:fallback_index_html]

  def fallback_index_html
    render file: 'public/index.html'
  end

  protected

  def get_paging_params
    if params[:page]
      @page = params[:page].to_i
      if @page == 0
        @page = 1
      end
    else
      @page =  1
    end

    if params[:per_page]
      @per_page = params[:per_page].to_i
      if @per_page == 0
        @per_page = 10
      end
    else
      @per_page =  10
    end
  end

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end

  def login(user)
    @current_user = User.find(user.id)
    session[:user_id] = user.id
  end

  def logout(_user)
    session[:user_id] = nil
  end
end
