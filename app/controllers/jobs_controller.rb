class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :show, :update, :destroy]

  def index
    @jobs = Job.posts_by(current_user)
  end

  def new
    if user_signed_in?
      @job = Job.new
    else 
      redirect_to alljobs_path, notice: 'You do not have permission for this action!'
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id

    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: 'Your job was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    if user_signed_in? && @job.user_id == current_user.id
    else
      redirect_to alljobs_path, notice: 'You do not have permission for this action!'
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to jobs_path, notice: 'The Job was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    if @job.user_id == current_user.id
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was removed.' }
      end
    else
      redirect_to jobs_path, notice: 'You not right user'
    end
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title,
                                  :salary,
                                  :hires,
                                  :description,
                                  :email,
                                  :address,
                                  :experience,
                                  :job_type_id,
                                  :job_area_id,
                                  :education_id,
                                  :user_id)
    end
end
