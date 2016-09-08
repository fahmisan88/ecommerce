class AddCatIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :cat_id, :integer
  end
end
