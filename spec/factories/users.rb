FactoryBot.define do
  factory :user do
    name { 'test' }
    profile { 'テスト' }
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
