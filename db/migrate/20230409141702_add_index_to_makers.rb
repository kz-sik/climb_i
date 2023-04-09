class AddIndexToMakers < ActiveRecord::Migration[6.1]
  def change
    add_index :makers, :name, unique: true
  end
end
