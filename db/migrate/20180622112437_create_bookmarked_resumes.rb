class CreateBookmarkedResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarked_resumes do |t|
    	t.integer :user_id
    	t.integer :resume_id

      t.timestamps
    end
  end
end
