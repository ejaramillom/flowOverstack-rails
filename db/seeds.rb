# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

6.times do
  User.create(email: Faker::Internet.email, password: 'usuario')
end
users_ids = User.all.pluck(:id)

6 .times do |post|
  Post.create(name: Faker::GreekPhilosophers.name, body: Faker::Books::Lovecraft.sentence, user_id: users_ids.sample)
end
posts_ids = Post.all.pluck(:id)

6.times do |answer|
  Answer.create(body: Faker::Books::Lovecraft.sentence, post_id: posts_ids.sample, user_id: users_ids.sample)
end
answers_ids = Answer.all.pluck(:id)

6.times do |comment|
  Comment.create(body: Faker::GreekPhilosophers.quote, user_id: users_ids.sample)
end
comments_ids = Comment.all.pluck(:id)
