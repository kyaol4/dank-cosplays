class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :update]
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.costume = @costume
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render '/costumes/new'
    end
  end

  def update
    @booking.costume = @costume
    authorize @booking
    if @booking.update(booking_params)
      redirect_to costume_path(@costume)
    else
      render costume_path(@costume)
    end
  end

  private

  def set_booking
    @costume = Costume.find(params[:costume_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
