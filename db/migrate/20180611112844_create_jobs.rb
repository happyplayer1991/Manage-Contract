class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :salary_min
      t.integer :salary_max
      t.integer :hires
      t.text :description
      t.string :email
      t.text :address
      t.integer :experience

      t.timestamps
    end
  end
end
