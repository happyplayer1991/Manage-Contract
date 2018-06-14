class PagesController < ApplicationController
	def index
	end

	def alljobs
		@all_jobs = Job.all
	end
end
