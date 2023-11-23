class BoatsController < ApplicationController
  before_action :set_boat, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @boats = Boat.all
    if params[:query].present?
      @boats = @boats.where("location ILIKE ?", "%#{params[:query]}%")
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
  end
    end
      end
  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:location, :name, :capacity, :price, :photo)
  end

end
