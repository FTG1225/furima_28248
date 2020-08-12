FactoryBot.define do
  factory :item do
    name { Faker::Games::Fallout }
    description { Faker::Movies::StarWars }
    category_id       { Faker::Number.between(from: 2, to: 10) }
    status_id         { Faker::Number.between(from: 2, to: 7) }
    shipping_tax_id   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id  { Faker::Number.between(from: 2, to: 4) }
    price             { 1000 }
    user              { create(:user) }
    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end
