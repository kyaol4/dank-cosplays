class CostumesController < ApplicationController
  before_action :set_costume, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @costumes = policy_scope(Costume).order(created_at: :desc)
  end

  def show
    @booking = Booking.new
  end

  def new
    @costume = Costume.new
    authorize @costume
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    authorize @costume

    if @costume.save
      redirect_to @costume, notice: 'Costume was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @costume.destroy
    redirect_to costumes, notice: 'Costume was successfully destroyed.'
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def costume_params
    params.require(:costume).permit(:name, :size, :price, :photo)
  end
end
