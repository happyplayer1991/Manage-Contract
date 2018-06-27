class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  def index
    if user_signed_in?
      @resumes = Resume.build_by(current_user)
    else
      redirect_to root_path, notice: 'You do not have permission for this action!'
    end
  end

  def bookmarked_resumes
    if user_signed_in?
      @bookmarked_resumes = current_user.bookmarked_by_user_resumes
    else
      redirect_to root_path, notice: 'You do not have permission for this action!'
    end
  end

  def new
    if user_signed_in? && current_user.resumes.count == 0
      @resume = Resume.new
    else
      redirect_to allresumes_path, notice: 'You do not have permission for this action!'
    end
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.'
    else
      render :new
    end
  end

  def edit
    if user_signed_in? && @resume.user_id == current_user.id
    else
      redirect_to allresumes_path, notice: 'You do not have permission for this action!'
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  def show
    if @resume.public_resume? || @resume.user_id == current_user.id || !((@resume.job_ids & current_user.job_ids).empty?)
    else
      redirect_to root_path, notice: 'This is privat Resume'
    end
  end

  def destroy
    if @resume.user_id == current_user.id
      @resume.destroy
      redirect_to resumes_url, notice: 'Resume was successfully destroyed.'
    else
      redirect_to resumes_path, notice: 'You do not have permission for this action!'
    end
  end

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

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
                                     :employment_eligibility,
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
                                                                :_destroy],
                                    militaries_attributes: [:id,
                                                            :service_country,
                                                            :branch,
                                                            :rank,
                                                            :start_date,
                                                            :end_date,
                                                            :i_am_currently_serving,
                                                            :description,
                                                            :commendations,
                                                            :_destroy],
                                    awards_attributes: [:id,
                                                        :title,
                                                        :date_awarded,
                                                        :description,
                                                        :_destroy],
                                    groups_attributes: [:id,
                                                        :title,
                                                        :start_date,
                                                        :end_date,
                                                        :i_am_still_a_member,
                                                        :description,
                                                        :_destroy],
                                    patents_attributes: [:id,
                                                         :patent_number,
                                                         :title,
                                                         :url,
                                                         :date_awarded,
                                                         :description,
                                                         :_destroy],
                                    publications_attributes: [:id,
                                                              :title,
                                                              :url,
                                                              :date_published,
                                                              :description,
                                                              :_destroy])
    end
end
