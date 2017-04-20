class Actor < ApplicationRecord
  has_many :reviews, as: :reviewable

  validates :first_name, presence: true
  validates :last_name, presence: true
end
