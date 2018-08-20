class CreateJoinTableBlogTag < ActiveRecord::Migration[5.1]
  def change
    create_join_table :blogs, :tags do |t|
      # t.index [:blog_id, :tag_id]
      # t.index [:tag_id, :blog_id]
    end
  end
end
