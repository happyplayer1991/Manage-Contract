class PagesController < ApplicationController
  access all: { except: [:settings] }, user: { except: [:settings] }, superadmin: :all

  def index; end

  def alljobs
    if search_params.present?
      query = params[:q].presence || '*'
      @all_jobs = Job.search(query, Job.prepare_search(search_params))
      @filter_active = true
      #binding.pry
    else
      @all_jobs = Job.search('*', Job.prepare_search(search_params))
    end
  end

  def allcompanies
    @all_companies = Company.all
  end

  def allresumess
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

  def alert
    @keywords = Keyword.set_by(current_user)
  end

  def subscribed_jobs
    @keywords = Keyword.set_by(current_user)
    if @keywords.blank?
      redirect_to(alert_path, alert: "Empty keywords! Go to Alert Job!") and return
    else
      @parameter = @keywords[0].title.downcase
      @results = Job.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def search_params
    params.permit(:q, :address, :sort_by, experience: [], job_type: [], education: [], job_title: [], city: [])
  end
end
