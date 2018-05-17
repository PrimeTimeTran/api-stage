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
# http :3001/v1/signup email=loi@email.com password=asdfas password_confirmation=asdfas

# Login
# http :3001/v1/auth/login email=loi@email.com password=asdfas password_confirmation=asdfas

# Fetch posts
# http :3001/v1/posts Accept:"application/vnd.posts.v1+json" Authorization:"eyJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1MjY2NTk2MzJ9.4vXTDG5IrF8uD_l9ph8obhpyYS8YfZqJFPhSx5OsqweE7i2vPyjwiEpqhJU2fKtK70F0B1_tEUQrKpyOCQzpdQ"