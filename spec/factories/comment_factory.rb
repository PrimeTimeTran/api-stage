FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }

    association :user, factory: :user
  end
end