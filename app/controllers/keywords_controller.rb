class KeywordsController < ApplicationController
  access all:[], user: :all, superadmin: :all

  before_action :set_keyword, only: [:edit, :show, :update, :destroy]

  def index
    @keywords = Keyword.find_by_user_id(curent_user.id)
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.user_id = current_user.id

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to subscribed_jobs_path, notice: 'Your keyword was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to alert_path, notice: 'The keyword was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to alert_path, notice: 'The keyword was removed.' }
    end
  end

  private
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    def keyword_params
      params.require(:keyword).permit(:title, :user_id)
    end
end
