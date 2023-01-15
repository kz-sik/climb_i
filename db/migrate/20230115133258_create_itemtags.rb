class CreateItemtags < ActiveRecord::Migration[6.1]
  def change
    create_table :itemtags do |t|

      t.integer :item_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
