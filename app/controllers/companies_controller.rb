class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :show, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Your Company was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'The Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was removed.' }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:title,
                                  :hires_per_year,
                                  :name,
                                  :phone,
                                  :country,
                                  :city,
                                  :postal_code,
                                  :payment_info,
                                  :about,
                                  :why_join_us,
                                  :website,
                                  :industry,
                                  :number_of_employee,
                                  :logo,
                                  :photo0,
                                  :photo1,
                                  :photo2,
                                  :photo3,
                                  :photo4,
                                  :photo5,
                                  :photo6,
                                  :photo7,
                                  :photo8,
                                  :photo9,
                                  :user_id)
    end
end
