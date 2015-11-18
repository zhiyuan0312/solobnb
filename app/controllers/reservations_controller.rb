class ReservationsController < ApplicationController

  def new
  	@reservation = Reservation.new
    @listing = Listing.find(params[:id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)
    byebug
    if @reservation.save
      redirect_to '/'
    else
      error_message 'reservation not available'
    end
  end

  def show
  end

  def index
    @reservation = Reservation.where(user_id: current_user.id)
  end

private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :owner, :user_id, :listing_id)
  end

end
