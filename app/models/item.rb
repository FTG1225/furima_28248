class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_one :address
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_tax
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
end
