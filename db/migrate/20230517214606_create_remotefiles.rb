class CreateRemotefiles < ActiveRecord::Migration[7.0]
  def change
    create_table :remotefiles do |t|
      t.string :filename
      t.string :awsbucked_identifier

      t.timestamps
    end
  end
end
