class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :i_am_still_a_member
      t.text :description
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
