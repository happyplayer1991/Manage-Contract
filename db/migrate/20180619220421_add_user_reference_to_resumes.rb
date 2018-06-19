class AddUserReferenceToResumes < ActiveRecord::Migration[5.1]
  def change
  	add_reference :resumes, :user, foreign_key: true
  end
end
