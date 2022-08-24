class LikesController < ApplicationController
  def index
    @likes = current_employee.blogs
  end
  
  def new
    @like = Like.new
  end

  def create
    @like = current_employee.likes.create(id: params[:id])
    redirect_to blogs_path
  end

end
