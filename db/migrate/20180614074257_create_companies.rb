class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :title
      t.integer :hires_per_year
      t.string :name
      t.string :phone
      t.string :country
      t.string :city
      t.integer :postal_code
      t.text :payment_info
      t.text :about
      t.text :why_join_us
      t.string :website
      t.string :industry
      t.integer :number_of_employee
      t.text :logo
      t.text :photo0
      t.text :photo1
      t.text :photo2
      t.text :photo3
      t.text :photo4
      t.text :photo5
      t.text :photo6
      t.text :photo7
      t.text :photo8
      t.text :photo9

      t.timestamps
    end
  end
end
