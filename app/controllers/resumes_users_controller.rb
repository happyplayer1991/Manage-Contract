class ResumesUsersController < ApplicationController
  #before_action :authenticate_user!
  #before_action :find_resume!

  #def build
  #  @user = current_user
  #  @resume.resumes_users << @user
  #  redirect_to :back
  #end

  #private
  #  def find_resume!
  #    @resume = Resume.find_by_id(params[:id])
  #  end

  #respond_to :js


  def bookmark_resume
    @user = current_user
    @resume = Resume.find(params[:resume_id])
    @user.bookmark_resume!(@resume)
  end

  def unbookmark_resume
    @user = current_user
    @bookmark_resume = @user.resumes_users.find_by_resume_id(params[:resume_id])
    @resume = Resume.find(params[:resume_id])
    @bookmark_resume.destroy
  end

end
