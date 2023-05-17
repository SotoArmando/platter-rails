class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
