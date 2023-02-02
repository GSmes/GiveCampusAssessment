FactoryBot.define do
  factory :campaign do
    name { FFaker::Education.school }
    start_date { rand(1..100).days.ago }
    end_date { rand(10..100).days.from_now }
  end
end
