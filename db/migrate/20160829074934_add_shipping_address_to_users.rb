class AddShippingAddressToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shipping_address, :string
  end
end
