class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
			t.string   :historiable_type
			t.bigint   :historiable_id
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
    
		add_index  :histories, [:historiable_id, :historiable_type]
  end
end
