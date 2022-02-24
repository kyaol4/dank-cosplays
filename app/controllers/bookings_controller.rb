class BookingsController < ApplicationController
  before_action :set_booking, only: [:update]
  before_action :set_costume, only: [:create]
  def index
    @bookings = policy_scope(Booking).order(end_date: :desc)
    @bookings_as_owner = current_user.bookings_as_owner.order(end_date: :desc)
    # raise
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.costume = @costume
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render '/bookings/new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    # @costume = @booking.costume
    authorize @booking
    if @booking.update(booking_params)
      if @booking.user == current_user
        redirect_to bookings_path, notice: 'Booking was successfully updated.'
      else
        redirect_to owner_bookings_path
      end
    else
      render :show
    end
  end

  private

  def set_costume
    @costume = Costume.find(params[:costume_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
