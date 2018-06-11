class Education < ApplicationRecord
	validates_presence_of :title

	has_many :jobs
end
