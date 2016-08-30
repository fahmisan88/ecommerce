class Item < ApplicationRecord
  has_many :orders, through: :ordered_items
end
