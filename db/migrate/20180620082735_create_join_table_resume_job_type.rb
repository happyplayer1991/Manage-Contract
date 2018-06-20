class CreateJoinTableResumeJobType < ActiveRecord::Migration[5.1]
  def change
    create_join_table :resumes, :job_types do |t|
      # t.index [:resume_id, :job_type_id]
      # t.index [:job_type_id, :resume_id]
    end
  end
end
