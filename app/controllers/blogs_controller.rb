class BlogsController < ApplicationController
  #access all: { except: [:new, :edit] }, user: { except: [:new, :edit] }, superadmin: :all
  before_action :set_blog, only: [:edit, :show, :update, :destroy]

  def new
    @blog = Blog.new
    @category = Category.new
    @categories = Category.all
    @tags = Tag.all
  end

  def create
    @publish_type = params[:publish_type]
    @blog = Blog.new(blog_params)
    puts "======================"
    puts blog_params
    puts "======================"
    respond_to do |format|
      if @blog.save
        @blog.update(published_at: Time.zone.now) if publish_immediately?
        publishing? ? @blog.update(status: 'active') : @blog.update(status: 'non_active')
        format.html { render :new}
      else
        @categories = Category.all
        format.html { render :new}
      end
    end
  end

  def edit
    @categories = Category.all
    @tags = Tag.all
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        @blog.update(published_at: Time.zone.now) if publish_immediately?
        publishing? ? @blog.update(status: 'active') : @blog.update(status: 'non_active')
        format.html { redirect_to allblogs_path, notice: 'Your Blog was successfully updated.' }
      else
        format.html { render :edit}
      end
    end
  end
  
  def show
    respond_to do |format|
      format.html {}
      format.js
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
      # @other_params.require(:blog).permit(:published_type)
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :published_at, :status, :featured_image, :remove_featured_image, :category_ids => [], :tag_ids => [])
    end

    def publishing?
        params[:commit] == "Publish"
    end

    # def saving_as_draft?
    #     params[:commit] == "Save as Draft"
    # end

    def publish_immediately?
        params[:publish_type].to_i > 0 
    end

    
end
