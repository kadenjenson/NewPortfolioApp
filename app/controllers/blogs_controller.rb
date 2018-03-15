class BlogsController < ApplicationController
  before_action :set_blog_item, only: [:edit, :show, :update, :destroy]
  layout "blogs"

  def index
    @blogs = Blog.by_position.all
  end

  def new
    @blog = Blog.new
    @page_title = "KJ | Blogs"
  end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html {redirect_to blogs_path, notice: 'Nice! The post is now live'}
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @page_title = @blog.title
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blogs_path, notice: 'Great editing on that blog post!' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @page_title = @blog.title
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_path, notice: 'That post was not worthy!' }
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, 
                                  :body, 
                                  technologies_attributes: [:id, :_destroy]
                                  )
  end

  def set_blog_item
    @blog = Blog.find(params[:id])
  end

end













