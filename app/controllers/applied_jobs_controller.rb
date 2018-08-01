class AppliedJobsController < ApplicationController
  before_action :authenticate_user!

  def apply_by_self_job
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'Log in and build your resume now'
      return
    end
    unless current_user.can_apply_job?
      redirect_to resumes_path, alert: 'Build your resume now to apply for job'
      return
    end
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.apply_by_self_job!(@job)
    redirect_to job_path(@job), notice: 'Job was applied!'
  end

  def unapply_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.unbookmark_job!(@job)
    redirect_to job_path(@job), notice: 'Delete bookmark successful'
  end

  def declined_job
    @user = current_user
    @job = Job.find(params[:id])
    @user.declined_job!(@job)
    redirect_to job_path(@job), notice: 'Job invite was declined!'
  end

  def apply_job
    @user = current_user
    @job = Job.find(params[:id])
    @user.apply_job!(@job)
    redirect_to job_path(@job), notice: 'Job invite was applied!'
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
