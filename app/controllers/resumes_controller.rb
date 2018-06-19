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
                                     :profile_pic,
                                     work_experiences_attributes: [:id,
                                                                   :job_title,
                                                                   :company,
                                                                   :country,
                                                                   :city,
                                                                   :start_date,
                                                                   :end_date,
                                                                   :years_of_experience,
                                                                   :i_currently_work_here,
                                                                   :job_description,
                                                                   :salary,
                                                                   :_destroy])
    end
end
