class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    # Add Blog
      t.string :title
      t.text   :content
      t.text :featured_image

      t.timestamps
    end
  end
end
