class AppliedJob < ApplicationRecord
  enum status: { applied: 0, submitted: 1, declined: 2 }

	belongs_to :resume
	belongs_to :job

	validates :resume_id, uniqueness: { scope: :job_id }
end
