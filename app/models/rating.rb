class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :rateable, polymorphic: true

  validate :appropriate_number

  private

  def appropriate_number
    unless [1,2,3,4,5].include?(self.stars)
      errors.add(:stars, "must be an integer between 1 and 5")
    end
  end
end
