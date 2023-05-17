class CreateBlogsTagsJoinTable < ActiveRecord::Migration[7.0]
  def change
		create_join_table :blogs, :tags do |t|
			t.index :blog_id
			t.index :tag_id
		end
  end
end
