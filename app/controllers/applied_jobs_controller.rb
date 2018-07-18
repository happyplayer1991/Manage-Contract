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

  def invite_to_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    if @resume.applied_jobs.where(job_id: @job.id).exists?
      redirect_to resume_path(@resume), notice: 'You already Invite this jobseeker'
    else
      @resume.applied_jobs.create(job_id: @job.id, status: 1)
      redirect_to resume_path(@resume), notice: 'Invite to Job was send'
    end
  end
end
