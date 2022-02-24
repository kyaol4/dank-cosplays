class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking]).order(end_date: :desc)
  end

  def update
    # @costume = @booking.costume
    authorize @booking
    if @booking.update(booking_params)
      redirect_to owner_bookings_path, notice: 'Booking was successfully updated.'
    else
      render :show
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
