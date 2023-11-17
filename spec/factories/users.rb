FactoryBot.define do
  factory :user do
    name { 'user' }
    profile { 'テスト' }
    email { 'usera@example.com' }
    password { 'passworda' }
    password_confirmation { 'passworda' }
  end

  factory :continuous_users, class: User do
    name { 'aaa' }
    sequence(:email) { |n| "user-#{n}@example.com" }
    profile { 'Hello' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :other do
    name { 'other' }
    profile { 'テスト' }
    email { 'userb@example.com' }
    password { 'passwordb' }
    password_confirmation { 'passwordb' }
  end
end
