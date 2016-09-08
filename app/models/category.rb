class Category < ApplicationRecord
  has_many :items, :foreign_key => "cat_id"
end
