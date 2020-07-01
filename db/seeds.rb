# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Subject.create(sub_name: "Math")
Subject.create(sub_name: "History")
Subject.create(sub_name: "English")
Subject.create(sub_name: "Science")
Book.create(title: "My First Book", author: "A Baby", publisher: "Baby House", pages: 30)
Book.create(title: "A Book About Nothing", author: "Jerry Seinfeld", publisher: "Larry David", pages: 150)
Book.create(title: "Left Hand of Darkness", author: "Ursula K. LeGuin", publisher: "UKG", pages: 250)
Book.create(title: "Ubik", author: "Philip K. Dick", publisher: "Publishing House", pages: 175)
Book.create(title: "Tropic of Cancer", author: "Henry Miller", publisher: "Miller Pub", pages: 300)
Book.create(title: "Flour, Water, Salt, Yeast", author: "Ken Forkish", publisher: "Food Publisher", pages: 190)
Book.create(title: "Live, Laugh, Book", author: "Karen", publisher: "Facebook Essential Oils", pages: 500)
Book.create(title: "The Third Body Problem", author: "Cixin Liu", publisher: "Problem House", pages: 350)
Book.create(title: "The Sound and the Fury", author: "William Faulkner", publisher: "Random House", pages: 120)
Book.create(title: "Mrs. Dalloway", author: "Virginia Woolf", publisher: "Penguin", pages: 375)
