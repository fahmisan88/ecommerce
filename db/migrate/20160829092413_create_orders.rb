class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :item_name
      t.integer :quantity
      t.float :price
      t.float :total

      t.timestamps
    end
  end
end
