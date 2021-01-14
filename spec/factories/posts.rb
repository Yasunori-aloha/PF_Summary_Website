FactoryBot.define do
  factory :post do
    name     { 'ポートフォリオサイト' }
    content  { Faker::Lorem.characters(number: 500) }
    url      { Faker::Internet.url }

    association :user
  end
end