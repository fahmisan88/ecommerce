class Item < ApplicationRecord
  has_many :orders, through: :ordered_items
  # mount_uploader :image, ImageUploader
end
