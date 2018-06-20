class CreateAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
      t.string :title
      t.date :date_awarded
      t.text :description
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
