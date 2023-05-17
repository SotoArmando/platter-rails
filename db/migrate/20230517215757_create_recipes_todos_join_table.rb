class CreateRecipesTodosJoinTable < ActiveRecord::Migration[7.0]
  def change
		create_join_table :recipes, :todos do |t|
			t.index :recipe_id
			t.index :todo_id
		end
  end
end
