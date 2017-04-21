class Actor < ApplicationRecord
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :actors_films, dependent: :destroy
  has_many :films, through: :actors_films
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end
end
