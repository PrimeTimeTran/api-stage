# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'asdfas' }
    password_confirmation { 'asdfas' }
  end
end
