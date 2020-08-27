FactoryBot.define do
  factory :purchase do
    item_id { 1 }
    user_id { 1 }
    token { "tok_123asd" }
    zip_code { '123-4567' }
    prefecture_id { 2 }
    city { '北海道' }
    house_number { '1-1' }
    building_name { '沖縄ビル' }
    phone_number { '09012345678' }
  end
end
