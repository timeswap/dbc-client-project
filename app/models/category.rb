class Category < ApplicationRecord
  has_many :categories_films
  has_many :films, through: :categories_films
  has_many :reviews, through: :films
end
