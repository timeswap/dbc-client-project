class Category < ApplicationRecord
  has_many :categories_films, dependent: :destroy
  has_many :films, through: :categories_films
  has_many :reviews, through: :films

  def recent
    self.reviews.order("created_at DESC").limit(5)
  end
end
