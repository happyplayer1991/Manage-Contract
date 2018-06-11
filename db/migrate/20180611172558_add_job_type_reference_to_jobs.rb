class AddJobTypeReferenceToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :job_type, foreign_key: true
  end
end
