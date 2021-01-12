FactoryBot.define do
  factory :commnte do
    association :user
    association :post
  end
end
