class CreatePatents < ActiveRecord::Migration[5.1]
  def change
    create_table :patents do |t|
      t.string :patent_number
      t.string :title
      t.string :url
      t.date :date_awarded
      t.text :description
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
