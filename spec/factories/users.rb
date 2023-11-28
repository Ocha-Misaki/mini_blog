FactoryBot.define do
  factory :user do
    name { 'user' }
    sequence(:email) { |n| "user#{n}@example.com" }
    profile { 'そろそろ眠いです' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
