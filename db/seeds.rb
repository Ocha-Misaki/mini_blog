50.times do
  content = Faker::Lorem.sentence(word_count: 10)
  Micropost.create!(content:)
end
