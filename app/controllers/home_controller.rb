# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authorize_request

  def index
  end
end
