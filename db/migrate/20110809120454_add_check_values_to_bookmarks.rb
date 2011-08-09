class AddCheckValuesToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :code, :integer
    add_column :bookmarks, :checked_at, :datetime
  end
end
