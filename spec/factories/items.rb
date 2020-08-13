FactoryBot.define do
  factory :item do
    user_id { 1 }
    name { 'Yamada' }
    description { 'This is an apple' }
    category_id       { Faker::Number.between(from: 2, to: 10) }
    status_id         { Faker::Number.between(from: 2, to: 7) }
    shipping_tax_id   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id  { Faker::Number.between(from: 2, to: 4) }
    price             { 1000 }
    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end
