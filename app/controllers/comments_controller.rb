class CommentsController < ApplicationController

  def index
    @comments = current_employee.blogs
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment=current_employee.comments.new(comment_params).merge(post_id: params[:post_id] )

    redirect_to blogs_path
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
