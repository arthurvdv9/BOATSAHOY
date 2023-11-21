class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, ]

  def index
    @bookings = Booking.all
    @boats = Boat.where(user: current_user)
  end

  def show; end

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Boat.find(params[:boat_id])
    @booking.user = current_user

    if @booking.save
      redirect_to boats_path notice:"Booking was successfully created."
    else
      render :index, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to bookings_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to bookings_path
  end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :boat_id)
  end


end
