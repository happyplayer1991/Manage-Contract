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
end
