class CreateRecipesFilesJoinTable < ActiveRecord::Migration[7.0]
  def change
		create_join_table :recipes, :remotefiles do |t|
			t.index :recipe_id
			t.index :remotefile_id
		end
  end
end
