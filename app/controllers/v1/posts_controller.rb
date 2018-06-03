# frozen_string_literal: true

module V1
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      @posts = Post.all.order('created_at DESC')
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

# Signup
# http :3001/v1/signup email=loi@gmail.com password=asdfas password_confirmation=asdfas

# Login
# http :3001/v1/auth/login email=do@gmail.com password=asdfas password_confirmation=asdfas

# Fetch posts
# http :3001/v1/posts Accept:"application/vnd.posts.v1+json" Authorization:"eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoyMSwiZXhwIjoxNTU5NTI3MTI3fQ.06c2qq-LSx3WekKrOcvuhGLiNTPndu394pTHc53qgTgBJM3dK1LFFgToaXoCxhBK92oESkygzBmhTAzjDDeY1A"
