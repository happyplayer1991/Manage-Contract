class UsersController < ApplicationController
	def toggle_interface
    user = current_user
    if user.jobseeker?
      user.recruiter!
    elsif user.recruiter?
      user.jobseeker!
    end

    redirect_to root_path, notice: 'User interface has been changed.'
  end

  def change_action
    @user = User.find(params[:id])
    @status = params[:status]

    # change action
    if @status == 'delete'
      @user.destroy
      @notice = 'The User was removed.'
    elsif @status == 'suspend'
      if @user.update(:status => 'suspended')
        @notice = 'The User was suspended.'
      else
        @notice = 'The User status is not updated.'
      end
    elsif @status == 'lift_suspend'
      if @user.update(:status => 'active')
        @notice = 'The User was active.'
      else
        @notice = 'The User status is not updated.'
      end
    end

    #refresh page
    respond_to do |format|
      format.js { render inline: "location.reload();", notice: @notice }
    end

  end
end
