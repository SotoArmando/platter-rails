class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.references :session, null: false, foreign_key: true
      t.string :title
      t.string :introduction
      t.string :unbounded
      t.references :file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
