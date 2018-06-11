class Job < ApplicationRecord
  enum job_type: { full_time: 0, part_time: 1, temporary: 2, contract: 3, internship: 4, commission: 5, volunteer: 6, permanent: 7 }
end
