FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    sur_name              { '山田' }
    given_name            { '一郎' }
    sur_name_kana         { 'ヤマダ' }
    given_name_kana       { 'イチロウ' }
    date_of_birth         { Faker::Date.between(from: '1900-01-01', to: Date.today) }
  end
end
