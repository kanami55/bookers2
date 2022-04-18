class Book < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: :true
  validates :body, presence: :true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
