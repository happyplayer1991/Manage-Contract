class JobType < ApplicationRecord
	validates_presence_of :title
  validates :title, uniqueness: true

  has_and_belongs_to_many :resumes
	has_many :jobs
end
