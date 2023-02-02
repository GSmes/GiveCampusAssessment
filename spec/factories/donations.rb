FactoryBot.define do
  factory :donation do
    campaign
    donor

    amount { rand(1..100).to_f }

    trait :match_donation do
      match { true }
    end
  end
end
