class ReviewsController < ApplicationController
  access all: [:show, :index], user: :all, superadmin: :all
  before_action :set_review, only: [:edit, :show, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @reviews = @company.reviews
    #@reviews = Review.find_by_company_id(params[:company_id])
    #@company = @review.company
  end

  def new
    if user_signed_in?
      @review = Review.new
      @company = Company.find(params[:company_id])
    else
      redirect_to allcompanies_path, notice: 'You do not have permission for this action!'
    end
  end

  def create
    @company = Company.find(params[:company_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.company_id = @company.id
    @review.average = ((@review.balance.to_f + @review.benefits.to_f + @review.advancement.to_f + @review.management.to_f + @review.culture.to_f) / 5).round(2)

    respond_to do |format|
      if @review.save
        format.html { redirect_to company_path(@company), notice: 'Your Review was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @company = @review.company
    if user_signed_in? && @review.user_id == current_user.id
    else
      redirect_to allcompanies_path, notice: 'You do not have permission for this action!'
    end
  end

  def update
    @company = Company.find(params[:company_id])
    #@review.company_id = @company.id
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to company_review_path(@company, @review), notice: 'The Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @company = Company.find(params[:company_id])
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      respond_to do |format|
        format.html { redirect_to company_reviews_path, notice: 'The Job was removed.' }
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
      params.require(:review).permit(:balance,
                                  :benefits,
                                  :advancement,
                                  :management,
                                  :culture,
                                  :question1,
                                  :question2,
                                  :question3,
                                  :question4,
                                  :question5,
                                  :description)
    end
end
