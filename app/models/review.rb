class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy


  validates :text, presence: true

  def raters
    if self.ratings.empty?
      []
    else
      self.ratings.map {|rating| rating.user}
    end
  end

  def rating_avg
    if self.ratings.empty?
      "no ratings yet!"
    else
      total = self.ratings.reduce(0) { |sum, rating| sum + rating.stars }
      avg = total / self.ratings.length.to_f
      avg.round(2)
    end
  end

  def reviewed_at
    self.created_at.asctime
  end

  def self.recent
    Review.order("created_at DESC").limit(5)
  end
end
