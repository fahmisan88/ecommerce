class AddPriceFloatToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :price, :float
  end
end
