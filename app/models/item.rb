class Item < ApplicationRecord
  has_many :orders, through: :ordered_items
  has_many :ordered_items
  mount_uploader :image, ImageUploader
  searchkick
end


#To add item thru terminal using gem carrierwave
# query an item (eg i = Item.first)
# i.remote_image_url = "<-image-url->"
# i.save
