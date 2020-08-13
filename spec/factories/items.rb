FactoryBot.define do
  factory :item do
    association :user
    name { 'Yamada' }
    description { 'This is an Apple' }
    category_id       { 2 }
    status_id         { 2 }
    shipping_tax_id   { 2 }
    prefecture_id     { 2 }
    shipping_date_id  { 2 }
    price             { 1000 }
    images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end
