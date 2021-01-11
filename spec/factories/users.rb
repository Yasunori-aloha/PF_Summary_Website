FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.free_email }
    password              {'1234567a'}
    password_confirmation { password }
  end
end