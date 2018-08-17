class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
  end
end
