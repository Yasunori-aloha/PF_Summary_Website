FactoryBot.define do
  factory :user do
    nickname              { '太郎' }
    email                 { Faker::Internet.unique.free_email }
    password              { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end