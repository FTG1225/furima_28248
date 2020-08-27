class Purchase
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid.' }
  end
  validates :phone_number, length: { maximum: 11, message: 'Phone number is invalid.' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    ItemPurchase.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end
