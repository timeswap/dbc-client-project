class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy


  validates :text, presence: true

  def self.recent
    Review.order_by("created_on").limit(5)
  end
end
