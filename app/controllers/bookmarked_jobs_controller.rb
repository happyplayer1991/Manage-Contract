class BookmarkedJobsController < ApplicationController
  before_action :authenticate_user!, only: [:unbookmark_job]

  def bookmark_job
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'Log in and build your resume now'
      return
    end
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.bookmark_job!(@job)
    redirect_back(fallback_location: job_path(@job), notice: 'Added to bookmarks')
  end

  def unbookmark_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.unbookmark_job!(@job)
    redirect_back(fallback_location: job_path(@job), notice: 'Delete bookmark successful')
  end
end
