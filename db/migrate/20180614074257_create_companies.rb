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

      t.timestamps
    end
  end
end
