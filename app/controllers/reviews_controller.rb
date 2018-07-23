class ReviewsController < ApplicationController
  access all: [:show], user: :all, superadmin: :all
  before_action :set_review, only: [:edit, :show, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    if user_signed_in?
      @review = Review.new
    else
      redirect_to allcompanies_path, notice: 'You do not have permission for this action!'
    end
  end

  def create
    @company = Company.find_by(params[:id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.company_id = @company.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to company_path(@company), notice: 'Your Review was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    if user_signed_in? && @review.user_id == current_user.id
    else
      redirect_to allcompanies_path, notice: 'You do not have permission for this action!'
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to companies_path, notice: 'The Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'The Job was removed.' }
      end
    else
      redirect_to jobs_path, notice: 'You do not have permission for this action!'
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:question1,
                                  :question2,
                                  :question3,
                                  :question4,
                                  :question5,
                                  :description)
    end
end
