# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Film.destroy_all
Category.destroy_all
Actor.destroy_all
Review.destroy_all

Category.create([{title: "Drama"}, {title: "Romance"}, {title:"Action"}, {title:"Fantasy"}, {title:"Animation"}, {title:"Horror"}, {title:"Mystery"}, {title:"Thriller"}])
Film.create([{title: "Titanic"}, {title: "Akira"}, {title: "Forrest Gump"}, {title: "The Matrix"}, {title: "Spirited Away"}, {title: "Psycho"}, {title: "Memento"}, {title: "The Shining"}, {title: "Your Name."}, {title: "Old Boy"}])
Actor.create([{first_name: "Leonardo", last_name: "DiCaprio"}, {first_name: "Tom", last_name: "Hanks"}, {first_name: "Carrie-Anne", last_name: "Moss"}, {first_name: "Anthony", last_name: "Perkins"}, {first_name: "Janet", last_name: "Leigh"}, {first_name: "Carrie-Anne", last_name: "Moss"}, {first_name: "Guy", last_name: "Pearce"}, {first_name: "Jack", last_name: "Nicholson"}, {first_name: "Jie-tae", last_name: "Yu"}])
Review.create([{text: "Great Movie"}, {text:"Piece of crap"}, {text:"Just ok"}])
Film.first.reviews << Review.find(1)
Film.find(2).reviews << Review.find(2)
Film.first.categories << Category.find(1)
Film.first.categories << Category.find(2)

