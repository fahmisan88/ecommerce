class ChangeColumnStatusOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :status, :integer
  end
end
