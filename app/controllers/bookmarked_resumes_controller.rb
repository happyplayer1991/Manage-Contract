class BookmarkedResumesController < ApplicationController
  before_action :authenticate_user!

  def bookmark_resume
    @user = current_user
    @resume = Resume.find(params[:resume_id])
    @user.bookmark_resume!(@resume)
    redirect_to resume_path(@resume), notice: 'Added to bookmarks'
  end

  def unbookmark_resume
    @user = current_user
    @resume = Resume.find(params[:resume_id])
    @user.unbookmark_resume!(@resume)
    redirect_to resume_path(@resume), notice: 'Delete bookmark successful'
  end

end
