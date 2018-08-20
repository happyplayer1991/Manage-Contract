class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
    # Add question and answer fields
      t.string :question
      t.string :answer
      t.integer :status, default: 1
      t.timestamps null: false
    end
  end
end
