class Film < ApplicationRecord
  has_many :ratings, as: :rateable
  has_many :reviews, as: :reviewable
  has_many :comments, as: :commentable
  has_many :actors_films
  has_many :actors, through: :actors_films
  has_many :categories_films
  has_many :categories, through: :categories_films
end
