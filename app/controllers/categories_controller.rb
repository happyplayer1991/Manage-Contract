class CategoriesController < ApplicationController
    include ApplicationHelper

    before_action :set_category, only: [:edit, :show, :update, :destroy]
    after_action :save_my_previous_url, only: [:edit, :show, :update, :destroy]

    def new
    end
    
    def create
    end

    def edit
    end

    def update
        respond_to do |format|
            if @category.update(category_params)
              format.html { redirect_to session[:my_previous_url], notice: 'Your Category was successfully updated.' }
            else
              format.html { render :edit}
            end
        end
    end

    def show
    end

    def destroy
        @category.destroy
        respond_to do |format|
            format.html { redirect_to session[:my_previous_url], notice: 'Your Category was removed.' }
        end
    end

    def add
        @category = Category.new(category_post_parmas)
        if @category.save
            @categories = Category.all
            respond_to do |format|
                # format.js
                # format.html { render :partial => 'categories/list', :locals => { categories: @categories } }
                # format.json { render :json => 'categories/list', :locals => { categories: @categories } }
                # format.json { 
                #     render :json => { :attachmentPartial => render_to_string('categories/list', :layout => false, :locals => { :categories => @categories }) }
                # }
                format.json {
                    render :json => @category
                }
            end
        else
        end

    end

    private
        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.require(:category).permit(:name)
        end

        def category_post_parmas
            params.require(:category).permit(:name)
        end

        def save_my_previous_url
            session[:my_previous_url] = URI(request.referer || '').path
        end
end
