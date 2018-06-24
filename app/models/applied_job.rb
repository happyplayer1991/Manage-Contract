class AppliedJob < ApplicationRecord
	belongs_to :resume
	belongs_to :job

	validates :resume_id, uniqueness: { scope: :job_id }
end
