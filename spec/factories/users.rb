FactoryBot.define do
  factory :user do
    nickname              { 'a_bc' }
    email                 { 'test@gmail.com' }
    password              { '12345a' }
    password_confirmation { '12345a' }
    sur_name              { '山田' }
    given_name            { '一郎' }
    sur_name_kana         { 'ヤマダ' }
    given_name_kana       { 'イチロウ' }
    date_of_birth         { '1900-1-1' }
  end
end