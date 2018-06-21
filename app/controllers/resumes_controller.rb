class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /resumes
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  def show
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /resumes/1
  def update
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resumes/1
  def destroy
    @resume.destroy
    redirect_to resumes_url, notice: 'Resume was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resume_params
      params.require(:resume).permit(:first_name,
                                     :last_name,
                                     :country,
                                     :city,
                                     :contact_information,
                                     :phone,
                                     :degree,
                                     :school,
                                     :field_of_study,
                                     :education_country,
                                     :education_city,
                                     :education_start_date,
                                     :education_end_date,
                                     :desired_job_title,
                                     :desired_salary_per_month,
                                     :desired_salary_per_year,
                                     :employement_eligibility,
                                     :relocation,
                                     :additional_information_step_4,
                                     :additional_information_step_5,
                                     :blog_url,
                                     :personal_homepage,
                                     :facebook,
                                     :twitter,
                                     :profile_pic,
                                     :status,
                                     job_type_ids:[],
                                     work_experiences_attributes: [:id,
                                                                   :job_title,
                                                                   :company,
                                                                   :country,
                                                                   :city,
                                                                   :start_date,
                                                                   :end_date,
                                                                   :years_of_experience,
                                                                   :less_than_one_year,
                                                                   :job_type_work_exp,
                                                                   :i_currently_work_here,
                                                                   :job_description,
                                                                   :salary,
                                                                   :salary_status,
                                                                   :_destroy],
                                    skills_attributes: [:id,
                                                        :title,
                                                        :experience,
                                                        :_destroy],
                                    certifications_attributes: [:id,
                                                                :title,
                                                                :start_date,
                                                                :end_date,
                                                                :description,
                                                                :_destroy])
    end
end
