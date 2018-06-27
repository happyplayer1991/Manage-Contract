class Job < ApplicationRecord
  validates_presence_of :title, :salary_min, :salary_max, :hires, :description, :experience, :expiry_date

  belongs_to :user
  belongs_to :job_area
  belongs_to :job_type
  belongs_to :education

  has_many :bookmarked_jobs, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarked_jobs, source: :user

  has_many :applied_jobs, dependent: :destroy
  has_many :resumes, through: :applied_jobs, source: :resume

  scope :posts_by, ->(user) { where(user_id: user.id) }
end
