FactoryBot.define do
  factory :memo do
    text { Faker::Lorem.sentence }
    association :user
    association :client
  end
end
