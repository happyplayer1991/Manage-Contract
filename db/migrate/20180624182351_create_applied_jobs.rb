class CreateAppliedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_jobs do |t|
    	t.integer :resume_id
    	t.integer :job_id

      t.timestamps
    end
  end
end
