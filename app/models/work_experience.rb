class WorkExperience < ApplicationRecord
  enum salary_status: { hide: 0, show: 1 }
  belongs_to :resume

  validates_presence_of :job_title
end
