class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :url
      t.date :date_published
      t.text :description
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
