class CreateBlogsFilesJoinTable < ActiveRecord::Migration[7.0]
  def change
		create_join_table :blogs, :remotefiles do |t|
			t.index :blog_id
			t.index :remotefile_id
		end
  end
end
