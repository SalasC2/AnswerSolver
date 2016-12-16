3.times do
  Question.create(inquiry: Faker::Hipster.sentence, title: Faker::GameOfThrones.house)
  Answer.create(solution: Faker::Hipster.words(3))
  Comment.create(remark: Faker::Hipster.sentences)
  User.create(username: Faker::GameOfThrones.character, email: Faker::Internet.email, password: Faker::Internet.password(5))
end
