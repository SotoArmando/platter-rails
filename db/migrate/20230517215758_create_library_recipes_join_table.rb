class CreateLibraryRecipesJoinTable < ActiveRecord::Migration[7.0]
  def change
		create_join_table :libraries, :recipes do |t|
			t.index :library_id
			t.index :recipe_id
		end
  end
end
