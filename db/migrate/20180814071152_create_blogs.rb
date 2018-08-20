class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    # Add Blog
      t.string :title
      t.text   :content
      t.text :featured_image
      t.datetime :published_at
    # Status
      t.integer :status, default: 1
      
      t.timestamps null: false
    end
  end
end
