class CreateWorkExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :work_experiences do |t|
      t.string :job_title
      t.string :company
      t.string :country
      t.string :city
      t.date	 :start_date
      t.date	 :end_date
      t.integer :years_of_experience
      t.boolean :i_currently_work_here
      t.text :job_description
      t.integer :salary
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
