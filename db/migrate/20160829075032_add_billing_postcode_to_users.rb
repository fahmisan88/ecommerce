class AddBillingPostcodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :billing_postcode, :string
  end
end
