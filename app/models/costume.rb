class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true
end
