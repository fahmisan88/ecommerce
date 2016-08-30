class OrderedItem < ApplicationRecord
  belongs_to :items
  belongs_to :order

end
