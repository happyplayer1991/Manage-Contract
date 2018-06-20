class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :title
      t.integer :experience
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
