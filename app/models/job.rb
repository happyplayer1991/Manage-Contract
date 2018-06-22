class Job < ApplicationRecord
  validates_presence_of :title, :salary_min, :salary_max, :hires, :description, :experience

  belongs_to :user
  belongs_to :job_area
  belongs_to :job_type
  belongs_to :education

  #has_many :jobs_users
  #has_many :users, through: :jobs_users

  scope :posts_by, ->(user) { where(user_id: user.id) }
end
