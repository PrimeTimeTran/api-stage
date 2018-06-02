FactoryBot.define do
  factory :conversation do
    body { Faker::Lorem.sentence }

    association :user, factory: :user
  end
end