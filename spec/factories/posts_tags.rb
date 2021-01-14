FactoryBot.define do
  factory :posts_tags do
    association :post
    association :tag
  end
end
