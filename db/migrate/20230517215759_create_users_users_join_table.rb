class CreateUsersUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
		create_table :friends do |t|
			t.integer :user_a_id, :null => false
			t.integer :user_b_id, :null => false
		end

		add_index  :friends, [:user_a_id, :user_b_id]
  end
end
