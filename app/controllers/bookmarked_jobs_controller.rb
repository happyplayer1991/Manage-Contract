class BookmarkedJobsController < ApplicationController
  before_action :authenticate_user!

  def bookmark_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.bookmark_job!(@job)
    redirect_to job_path(@job), notice: 'Added to bookmarks'
  end

  def unbookmark_job
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.unbookmark_job!(@job)
    redirect_to job_path(@job), notice: 'Delete bookmark successful'
  end

end
