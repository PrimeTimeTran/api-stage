# frozen_string_literal: true

module V1
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      @posts = Post.all.order('created_at DESC').limit(2)
      render json: @posts
    end

    # GET /posts/1
    def show
      render json: @post
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save
        if upload_params
          upload_params.each do
            @post.uploads.create!(user: @post.user, media: upload_params["upload"])
            media = @post.uploads.last
            media.media_type = params[:upload].content_type == 'video/mp4' ? 'video' : 'img'
            media.save
          end
        end
        @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:body, :user_id)
    end

    def upload_params
      params.permit(:upload)
    end
  end
end
