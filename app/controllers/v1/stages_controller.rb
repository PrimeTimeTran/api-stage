# frozen_string_literal: true

module V1
  class StagesController < ApplicationController
    def index
      stages = Stage.all.order('created_at DESC')
      render json: stages
    end

    def show
      stage = Stage.find(params[:id])
    end
  end
end
