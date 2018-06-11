class AddEducationReferenceToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :education, foreign_key: true
  end
end
