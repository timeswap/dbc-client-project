class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  has_many :ratings, as: :rateable
  has_many :comments, as: :commentable


  validates :text, presence: true

  def reviewed_at
    self.created_at.asctime
  end

  def self.recent
    Review.order("created_at DESC").limit(5)
  end
end
