class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:superadmin], multiple: false)                                      ##
  ############################################################################################


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :jobs, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :resumes, dependent: :destroy

  has_many :bookmarked_resumes, dependent: :destroy
  has_many :bookmarked_by_user_resumes, through: :bookmarked_resumes, source: :resume

  has_many :bookmarked_jobs, dependent: :destroy
  has_many :bookmarked_by_user_jobs, through: :bookmarked_jobs, source: :job

  has_many :keyword

  enum interface: { recruiter: 0, jobseeker: 1 }

  # Start. Link to sign up with interface
  attr_accessor :initial_interface

  def initial_interface=(interface_name)
      @initial_interface = interface_name
      if interface_name == 'jobseeker'
        self.jobseeker!
      else
        self.recruiter!
      end
  end

  def initial_interface
      @initial_interface
  end
  # Finish

  def self.new_with_session(params, session)
  	super.tap do |user|
    	if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      	user.email = data["email"] if user.email.blank?
    	end
  	end
	end

	def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
    	user.password = Devise.friendly_token[0,20]
    	user.name = auth.info.name
  	end
	end

  def bookmark_resume!(resume)
    self.bookmarked_resumes.create(resume_id: resume.id)
  end

  def unbookmark_resume!(resume)
    bookmark_resume = self.bookmarked_resumes.find_by_resume_id(resume.id)
    bookmark_resume.destroy!
  end

  def bookmark_resume?(resume)
    self.bookmarked_resumes.find_by_resume_id(resume.id)
  end

  def bookmark_job!(job)
    self.bookmarked_jobs.create(job_id: job.id)
  end

  def unbookmark_job!(job)
    bookmark_job = self.bookmarked_jobs.find_by_job_id(job.id)
    bookmark_job.destroy!
  end

  def bookmark_job?(job)
    self.bookmarked_jobs.find_by_job_id(job.id)
  end

  def apply_job!(job)
    apply_job = self.resumes[0].applied_jobs.create(job_id: job.id)
  end

  def unapply_job!(job)
    applied_job = self.resumes[0].applied_jobs.find_by_job_id(job.id)
    applied_job.destroy!
  end

  def applied_job?(job)
    self.resumes[0].applied_jobs.find_by_job_id(job.id)
  end

end
