class CreateAppliedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_jobs do |t|
    	t.integer :resume_id
      t.integer :job_id
    	t.integer :status, default: 0

      t.timestamps
    end
  end
end
