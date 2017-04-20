# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD

=======
>>>>>>> d554e1e54ca8eab58d31c0a24034cd22290e837d
User.destroy_all
Film.destroy_all
Category.destroy_all
Actor.destroy_all
Review.destroy_all
Rating.destroy_all

5.times do |x|
  User.create!(first_name: "tom#{x}" , last_name: "rogers#{x}", email:"tom@tom#{x}.com", password:'123456', trusted: [true,false].sample)
end

Category.create!([{title: "Drama"}, {title: "Romance"}, {title:"Action"}, {title:"Fantasy"}, {title:"Animation"}, {title:"Horror"}, {title:"Mystery"}, {title:"Thriller"}])
Film.create!([{title: "Titanic"}, {title: "Akira"}, {title: "Forrest Gump"}, {title: "The Matrix"}, {title: "Spirited Away"}, {title: "Psycho"}, {title: "Memento"}, {title: "The Shining"}, {title: "Your Name"}, {title: "Old Boy"}])
Actor.create!([{first_name: "Leonardo", last_name: "DiCaprio"}, {first_name: "Tom", last_name: "Hanks"}, {first_name: "Carrie-Anne", last_name: "Moss"}, {first_name: "Anthony", last_name: "Perkins"}, {first_name: "Janet", last_name: "Leigh"}, {first_name: "Carrie-Anne", last_name: "Moss"}, {first_name: "Guy", last_name: "Pearce"}, {first_name: "Jack", last_name: "Nicholson"}, {first_name: "Jie-tae", last_name: "Yu"}])
Review.create!([{text: "Great Movie", user: User.first, reviewable: Film.first}, {text:"Piece of crap", user: User.second, reviewable: Film.second}, {text:"Just ok", user: User.third, reviewable: Film.third}])
Film.first.categories << Category.first
Film.first.categories << Category.second



10.times do |x|
  film = Film.create!(title: "Serendipityx#{x}")
  category = Category.create!(title:"Romancex#{x}")
  actor = Actor.create!(first_name:"Namuun", last_name:"Pitt#{x}")
  film.categories << category
  film.actors << actor
  film.ratings << Rating.new(stars: rand(1..5), user: User.first)
  film.save!
end
