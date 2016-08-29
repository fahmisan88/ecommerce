class AddItemNameToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :item_name, :string
  end
end
