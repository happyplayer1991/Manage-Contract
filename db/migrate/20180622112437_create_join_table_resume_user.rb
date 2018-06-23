class CreateJoinTableResumesUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :resumes, :users do |t|
      t.index [:resume_id, :user_id]
      t.index [:user_id, :resume_id]

      t.timestamps
    end
  end
end
