class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :show, :update, :destroy]

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to allblogs_path, notice: 'Your Blog was created.' }
      else
        format.html { render :new}
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to allblogs_path, notice: 'Your Blog was removed.' }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title)
    end
end
