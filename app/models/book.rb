class Book < ApplicationRecord
  belongs_to :user

  validates :title, plesence: :true
  validates :body, plesence: :true
end
