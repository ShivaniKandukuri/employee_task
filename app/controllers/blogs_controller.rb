class BlogsController < ApplicationController
  before_action :set_blog, only: [ :show,:like ]

  def index
    @blogs = Blog.all
  end

  def show
  end
  def new
    @blog = Blog.new
  end
  def like
    Like.create(employee_id:current_employee.id,blog_id:@blog.id)
    redirect_to blogs_path
  end
  def create
    @blog = Blog.new(blog_params)
    @blog.organization_id=1
      if @blog.save
        flash[:notice]="blog created successfully"
        redirect_to @blog
      else
        render 'new'
      end

  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:post)
    end

end
