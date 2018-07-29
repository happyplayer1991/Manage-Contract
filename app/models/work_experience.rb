class WorkExperience < ApplicationRecord
  enum salary_status: { hide: 0, show: 1 }
  belongs_to :resume

  validates_presence_of :job_title

  after_commit :reindex_resume

  def reindex_resume
    resume.reindex
  end
end
