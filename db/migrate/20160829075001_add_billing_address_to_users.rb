class AddBillingAddressToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :billing_address, :string
  end
end
