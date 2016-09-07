class RemovePaidAtFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :paid_at, :datetime
  end
end
