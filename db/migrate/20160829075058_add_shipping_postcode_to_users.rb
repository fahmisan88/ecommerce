class AddShippingPostcodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :shipping_postcode, :string
  end
end
