class AppliedJobsController < ApplicationController
	before_action :authenticate_user!

  def apply_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.apply_job!(@job)
    redirect_to job_path(@job), notice: 'Job was applied!'
  end

  def unapply_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.unbookmark_job!(@job)
    redirect_to job_path(@job), notice: 'Delete bookmark successful'
  end
end
