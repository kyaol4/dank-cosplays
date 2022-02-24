class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, presence: true
  validates :size, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
