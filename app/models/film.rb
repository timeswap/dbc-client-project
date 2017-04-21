class Film < ApplicationRecord
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :actors_films, dependent: :destroy
  has_many :actors, through: :actors_films
  has_many :categories_films, dependent: :destroy
  has_many :categories, through: :categories_films

  def average_rating
    self.ratings.pluck(:stars).reduce(:+).to_f / self.ratings.length.to_f
  end

  def rating_avg
    if self.ratings.empty?
      "no ratings yet!"
    elsif self.ratings.length == 1
      self.ratings.first.stars
    else
      (self.ratings.reduce { |sum, rating| sum + rating.stars }) / self.ratings.length
    end
  end
end
