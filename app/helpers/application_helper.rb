module ApplicationHelper
  def active? path
		"active" if current_page?(path)
	end

  def interface_button
    if current_user.interface == "jobseeker"
      interface_name = "Recruiter"
    else
      interface_name = "Jobseeker"
    end
  end
end
