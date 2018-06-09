module V1
  class CommentsController < ApplicationController
    def create
      comment = current_user.comments.build(comment_params)

      if comment.save
        render json: comment
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end


    private
    def comment_params
      params.require(:comment).permit(:body, :commentable_type, :commentable_id)
    end
  end
end
