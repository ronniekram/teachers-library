# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  username = Faker::Name.unique.first_name
  name = Faker::Name.unique.name
  email = Faker::Internet.unique.email
  password = 'password'
  grade = '5th'
  User.create(username: username, name: name, email: email, password: password, grade: grade)
end 

Book.create(title: "title 1", author: "author1", subject: "subject 1", user_id: 1)
Book.create(title: "title 2", author: "author2", subject: "subject 2", user_id: 1)
Book.create(title: "title 3", author: "author3", subject: "subject 3", user_id: 1)
Book.create(title: "title 4", author: "author4", subject: "subject 4", user_id: 2)
Book.create(title: "title 5", author: "author5", subject: "subject 6", user_id: 2)

LessonPlan.create(name: "LP Name 1", subject: "subject1", duration: 1, user_id: 1)
LessonPlan.create(name: "LP Name 2", subject: "subject2", duration: 2, user_id: 1)
LessonPlan.create(name: "LP Name 3", subject: "subject3", duration: 1, user_id: 1)
LessonPlan.create(name: "LP Name 4", subject: "subject4", duration: 5, user_id: 1)
LessonPlan.create(name: "LP Name 5", subject: "subject5", duration: 3, user_id: 1)
LessonPlan.create(name: "LP Name 6", subject: "subject6", duration: 1, user_id: 2)
LessonPlan.create(name: "LP Name 7", subject: "subject7", duration: 1, user_id: 2)
LessonPlan.create(name: "LP Name 8", subject: "subject8", duration: 1, user_id: 2)
LessonPlan.create(name: "LP Name 9", subject: "subject9", duration: 1, user_id: 2)
LessonPlan.create(name: "LP Name 10", subject: "subject10", duration: 1, user_id: 2)

