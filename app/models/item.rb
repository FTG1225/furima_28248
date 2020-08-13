class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :images

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category
    validates :status
    validates :shipping_tax
    validates :prefecture
    validates :shipping_date
  end

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 40 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }

  belongs_to :user
  has_one :item_purchase
  has_one :address
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_tax
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
end
