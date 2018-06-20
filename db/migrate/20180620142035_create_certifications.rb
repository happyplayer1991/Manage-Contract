class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
