class AddIndexItemtags < ActiveRecord::Migration[6.1]
  def change
    add_index :itemtags, [:item_id, :tag_id], unique: true
  end
end
