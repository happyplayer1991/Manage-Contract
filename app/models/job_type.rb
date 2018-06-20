class JobType < ApplicationRecord
	validates_presence_of :title

  has_and_belongs_to_many :resumes
	has_many :jobs
end
