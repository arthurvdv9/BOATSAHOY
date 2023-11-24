class BookingsController < ApplicationController
  #before_action :set_booking, only: [:show]

  # NOT IN USE ANYMORE SINCE TWO DIFFERENT PAGES FOR REQUESTS AND DEMANDS
  # def index
  #   @bookings = Booking.all
  #   boat = Boat.find(params[:boat_id])
  #   @my_bookings = Booking.where(user: current_user)
  #   @pending_requests = Booking.select{ |booking| booking.boat.user == current_user && booking.status == "pending"}
  # end


  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Boat.find(params[:boat_id])
    @booking.user = current_user


    if @booking.save!
      redirect_to mybookings_path notice:"Booking was successfully created."

    else
      render :index, status: :unprocessable_entity
    end
  end

  def pending_requests
    # @pending_requests = Booking.select{ |booking| booking.boat.user == current_user && booking.status == "pending"}
    @pending_requests = Booking.select{ |booking| booking.boat.user == current_user }
  end

  def mybookings
    @my_bookings = Booking.where(user: current_user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to pendingrequests_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
    redirect_to pendingrequests_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to mybookings_path
  end

  def calculate_total
    start_date = Date.parse(params[:start_date])
  end_date = Date.parse(params[:end_date])
  total_price = @booking.calculate_total_price(start_date, end_date)
  total_days = @booking.calculate_total_days(start_date, end_date)

  render json: { totalPrice: total_price, totalDays: total_days }
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :boat_id)
  end


end
