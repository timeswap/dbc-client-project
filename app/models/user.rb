class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, as: :commentable
  has_many :reviews, as: :reviewable
  has_many :ratings, as: :rateable

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def set_user_permission(input_code)
    self.trusted = true if "ILOVENICHOLASCAGE" == input_code
  end
end
