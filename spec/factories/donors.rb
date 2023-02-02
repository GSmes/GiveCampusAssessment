FactoryBot.define do
  factory :donor do
    email { FFaker::Internet.safe_email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
