class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.belongs_to :user
      t.string :file
      t.datetime :processed_at

      t.timestamps
    end
    add_index :imports, :user_id
  end
end
