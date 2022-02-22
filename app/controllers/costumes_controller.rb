class CostumesController < ApplicationController
  before_action :set_costume, only: [:show, :destroy]
  def index
    @costumes = policy_scope(Costume).order(created_at: :desc)
  end

  def show
    @costume = Costume.find_by(params[:id])
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
    params.require(:costume).permit(:name, :size, :price)
  end
end