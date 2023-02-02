FactoryBot.define do
  factory :match do
    campaign
    donor

    amount { (rand(1..10)).to_f }
    remaining_balance { (rand(1..100)).to_f }

    trait :dollar_match do
      kind { :dollar }
      remaining_balance { (rand(1..100)).to_f }
    end

    trait :donor_match do
      kind { :donor }
      remaining_balance { (rand(1..10)).to_f }
    end

    trait :limit_reached do
      remaining_balance { 0.00 }
      state { :disabled }
    end

    trait :disabled do
      state { :disabled }
    end
  end
end
