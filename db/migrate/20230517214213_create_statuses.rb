class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
			t.string   :statusable_type
			t.bigint   :statusable_id
      t.string :text

      t.timestamps
    end
		add_index  :statuses, [:statusable_id, :statusable_type]

  end
end
