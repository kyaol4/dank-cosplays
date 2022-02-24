class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking]).order(end_date: :desc)
  end
end
