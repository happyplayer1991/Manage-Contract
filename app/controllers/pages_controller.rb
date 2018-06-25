class PagesController < ApplicationController
  access all: {except: [:settings]}, user: {except: [:settings]}, superadmin: :all
  
	def index
	end

	def alljobs
		@all_jobs = Job.all
	end

	def allcompanies
		@all_companies = Company.all
	end

  def allresumes
    @all_resumes = Resume.public_resume
  end

  def admin
    if !user_signed_in?
    else
      redirect_to root_path, notice: 'You already in the system'
    end
  end

  def settings
    @job_types = JobType.all
    @job_areas = JobArea.all
  end
end
