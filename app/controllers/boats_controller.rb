class BoatsController < ApplicationController
  before_action :set_boat, only: [:show]

  def index
    @boats = Boat.all
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:location, :name, :capacity, :price)
  end

end
