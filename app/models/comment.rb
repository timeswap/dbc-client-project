class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :text, presence: true

  def reviewed_at
    self.created_at.asctime
  end
end
