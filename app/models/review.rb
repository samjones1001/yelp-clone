class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :restaurant, dependent: :destroy
  has_many :endorsements
  validates :rating, inclusion: (1..5)
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
end
