class FaqsController < ApplicationController
  # access all:[], user:[], superadmin: :all
  before_action :set_faq, only: [:edit, :show, :update, :destroy]

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to allfaqs_path, notice: 'Your Faq was created.' }
      else
        format.html { render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @faq.save
        format.html { redirect_to allfaqs_path, notice: 'Your Faq was successfully updated.' }
      else
        format.html { render :edit}
      end
    end
  end

  def show
  end

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to allfaqs_path, notice: 'Your Faq was created.' }
    end
  end

  private
    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
end
