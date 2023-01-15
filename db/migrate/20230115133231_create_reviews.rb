class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.integer :star, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
