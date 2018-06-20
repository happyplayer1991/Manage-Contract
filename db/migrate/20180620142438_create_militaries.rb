class CreateMilitaries < ActiveRecord::Migration[5.1]
  def change
    create_table :militaries do |t|
      t.string :service_country
      t.string :branch
      t.string :rank
      t.date :start_date
      t.date :end_date
      t.boolean :i_am_currently_serving
      t.text :description
      t.text :commendations
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
