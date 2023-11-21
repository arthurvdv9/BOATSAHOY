class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.all
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to boats_path notice:"Booking was successfully created."
    else
      render :index, status: :unprocessable_entity
    end
  end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def boat_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :user_id, :boat_id)
  end

end
