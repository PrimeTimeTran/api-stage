FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { 'Loi' }
    last_name { 'Tran' }
    password { 'asdfas' }
    password_confirmation { 'asdfas' }
  end
end