class Film < ApplicationRecord
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :actors_films, dependent: :destroy
  has_many :actors, through: :actors_films
  has_many :categories_films, dependent: :destroy
  has_many :categories, through: :categories_films

  def average_rating
    return "No Ratings" if self.ratings.count == 0
    self.ratings.pluck(:stars).reduce(:+).to_f / self.ratings.length.to_f
  end

end
