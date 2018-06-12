class Job < ApplicationRecord
  validates_presence_of :title

  belongs_to :user
  belongs_to :job_area
  belongs_to :job_type
  belongs_to :education

  scope :posts_by, ->(user) { where(user_id: user.id)}
end
