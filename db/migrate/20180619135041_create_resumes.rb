class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :city
      t.text :contact_information
      t.string :phone
      t.string :degree
      t.string :school
      t.string :field_of_study
      t.string :education_country
      t.string :education_city
      t.date :education_start_date
      t.date :education_end_date
      t.string :desired_job_title
      t.integer :desired_salary_per_month
      t.integer :desired_salary_per_year
      t.integer :employment_eligibility, default: 0
      t.boolean :relocation
      t.text :additional_information_step_4
      t.text :additional_information_step_5
      t.string :blog_url
      t.string :personal_homepage
      t.string :facebook
      t.string :twitter
      t.text :profile_pic

      t.timestamps
    end
  end
end
