class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user
      t.string :uri
      t.string :uri_digest
      t.string :title
      t.text :description
      t.boolean :is_private
      t.boolean :is_starred
      t.boolean :is_unread

      t.timestamps
    end
    add_index :bookmarks, :user_id
    add_index :bookmarks, :uri_digest
    add_index :bookmarks, :is_private
    add_index :bookmarks, :is_starred
    add_index :bookmarks, :is_unread
  end
end
