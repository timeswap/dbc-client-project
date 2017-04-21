# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Film.destroy_all
Category.destroy_all
Actor.destroy_all
Review.destroy_all
Rating.destroy_all

5.times do |x|
  User.create!(first_name: "tom#{x}" , last_name: "rogers#{x}", email:"tom@tom#{x}.com", password:'123456', trusted: [true,false].sample)
end

User.create(first_name: 'tom', last_name: 'tom', email: 'tom@tom.com', password: 'tomtom', trusted: true)

Category.create!([{title: "Drama"}, {title: "Romance"}, {title:"Action"}, {title:"Fantasy"}, {title:"Animation"}, {title: "Adventure"}, {title: "Family"}, {title:"Horror"}, {title:"Mystery"}, {title:"Thriller"}, {title: "Sci-Fi"}])
Film.create!([{title: "Titanic"}, {title: "Akira"}, {title: "Forrest Gump"}, {title: "The Matrix"}, {title: "Spirited Away"}, {title: "Psycho"}, {title: "Memento"}, {title: "The Shining"}, {title: "Your Name"}, {title: "Old Boy"}])
Actor.create!([{first_name: "Leonardo", last_name: "DiCaprio"}, {first_name: "Tom", last_name: "Hanks"}, {first_name: "Carrie-Anne", last_name: "Moss"}, {first_name: "Anthony", last_name: "Perkins"}, {first_name: "Janet", last_name: "Leigh"}, {first_name: "Guy", last_name: "Pearce"}, {first_name: "Jack", last_name: "Nicholson"}, {first_name: "Jie-tae", last_name: "Yu"}])
Review.create!([{text: "Great Movie", user: User.first, reviewable: Film.first}, {text:"Piece of crap", user: User.second, reviewable: Film.second}, {text:"Just ok", user: User.third, reviewable: Film.third}, {text: "Mind Blown", user: User.first, reviewable: Film.fourth}, {text: "Meh", user: User.first, reviewable: Film.fifth}])

Film.find_by({title: "Titanic"}).categories = [Category.find_by({title: "Drama"}), Category.find_by({title: "Romance"})]
Film.find_by({title: "Titanic"}).actors = [Actor.find_by({first_name: "Leonardo", last_name: "DiCaprio"})]

Film.find_by({title: "Akira"}).categories = [Category.find_by({title: "Animation"}), Category.find_by({title: "Action"}), Category.find_by({title: "Drama"}), Category.find_by({title: "Fantasy"})]

Film.find_by({title: "Forrest Gump"}).categories = [Category.find_by({title: "Drama"}), Category.find_by({title: "Romance"})]
Film.find_by({title: "Forrest Gump"}).actors = [Actor.find_by({first_name: "Tom", last_name: "Hanks"})]

Film.find_by({title: "The Matrix"}).categories = [Category.find_by({title: "Action"}), Category.find_by({title: "Sci-Fi"})]
Film.find_by({title: "The Matrix"}).actors = [Actor.find_by({first_name: "Carrie-Anne", last_name: "Moss"})]

Film.find_by({title: "Spirited Away"}).categories = [Category.find_by({title: "Animation"}), Category.find_by({title: "Adventure"}), Category.find_by({title: "Family"})]

Film.find_by({title: "Psycho"}).categories = [Category.find_by({title: "Horror"}), Category.find_by({title: "Mystery"}), Category.find_by({title: "Thriller"})]
Film.find_by({title: "Psycho"}).actors = [Actor.find_by({first_name: "Anthony", last_name: "Perkins"}), Actor.find_by({first_name: "Janet", last_name: "Leigh"})]

Film.find_by({title: "Memento"}).categories = [Category.find_by({title: "Mystery"}), Category.find_by({title: "Thriller"})]
Film.find_by({title: "Memento"}).actors = [Actor.find_by({first_name: "Carrie-Anne", last_name: "Moss"}), Actor.find_by({first_name: "Guy", last_name: "Pearce"})]

Film.find_by({title: "The Shining"}).categories = [Category.find_by({title: "Drama"}), Category.find_by({title: "Horror"})]
Film.find_by({title: "The Shining"}).actors = [Actor.find_by({first_name: "Jack", last_name: "Nicholson"})]

Film.find_by({title: "Your Name"}).categories = [Category.find_by({title: "Animation"}), Category.find_by({title: "Drama"}), Category.find_by({title: "Romance"})]

Film.find_by({title: "Old Boy"}).categories = [Category.find_by({title: "Action"}), Category.find_by({title: "Drama"}), Category.find_by({title: "Mystery"}), Category.find_by({title: "Thriller"})]
Film.find_by({title: "Old Boy"}).actors = [Actor.find_by({first_name: "Jie-tae", last_name: "Yu"})]


# 10.times do |x|
#   film = Film.create!(title: "Serendipityx#{x}")
#   category = Category.create!(title:"Romancex#{x}")
#   actor = Actor.create!(first_name:"Namuun", last_name:"Pitt#{x}")
#   film.categories << category
#   film.actors << actor
#   film.ratings << Rating.new(stars: rand(1..5), user: User.first)
#   film.save!
# end
