class RemoveColumnsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :item_name, :string
    remove_column :orders, :quantity, :integer
    remove_column :orders, :bill_id, :string
    remove_column :orders, :bill_url, :string
    remove_column :orders, :due_at, :datetime
    remove_column :orders, :total, :float
    remove_column :orders, :price, :float

    add_column :orders, :transaction_id, :string
    add_column :orders, :total, :decimal

  end
end
