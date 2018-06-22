class ResumesUsersController < ApplicationController

  def build
    @resume = Resume.find_by_id(params[:resume_id])
    @user = current_user
    @resume.users << @user
    redirect_to :back
  end

end
