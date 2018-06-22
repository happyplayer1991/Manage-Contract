class PagesController < ApplicationController
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
end
