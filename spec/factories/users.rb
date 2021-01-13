FactoryBot.define do
  factory :user do
    nickname              { '太郎' }
    email                 { Faker::Internet.unique.free_email }
    password              {'1234567a'}
    password_confirmation { password }
  end
end