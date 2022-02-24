class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: {
    pending: 0,
    approved: 1,
    rejected: 2
  }

  def pending?
    status == 'pending'
  end

end
