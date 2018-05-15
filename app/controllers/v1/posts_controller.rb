module V1
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.all.order("created_at DESC")
    end

    # GET /posts/1
    def show
      render json: @post
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save
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
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params

        params.require(:post).permit(:body, :user_id)
      end
  end
end

# Signup
# http :3000/v1/signup email=loi@email.com password=asdfas password_confirmation=asdfas

# Fetch posts
# http :3000/v1/posts Accept:"application/vnd.posts.v1+json" Authorization:"eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1MjYzODQ0MDB9.i55-fuCNRYw3LHiLhm4qYHzAF7Q-6ulXQCDFopASxReGuMlGL5qi27-0opomfkfK_GUV5u7IiI_8ztsWC4leeQ"
