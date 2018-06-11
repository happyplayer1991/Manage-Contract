class Job < ApplicationRecord
  validates_presence_of :title

  belongs_to :job_area
  belongs_to :job_type
  belongs_to :education
end
