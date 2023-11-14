User.create!(name: "Example User",
            email: "example@railstutorial.org",
            profile: "Nice to meet you",
            password: "foobar",
            password_confirmation: "foobar" )

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  profile = Faker::ProgrammingLanguage.name
  password = "password"
  User.create!(name:  name,
               email: email,
               profile: profile,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# ユーザーフォローのリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..9]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
