class ReservationsController < ApplicationController

  def new
  	@reservation = Reservation.new
    @listing = Listing.find(params[:id])
    @client_token = Braintree::ClientToken.generate
  end

  def create
    @client_token = Braintree::ClientToken.generate
  	@reservation = Reservation.new(reservation_params)
    if @reservation.save
      result = Braintree::Transaction.sale(
      :amount => @reservation.listing.price,
      :payment_method_nonce => params[:payment_method_nonce]
    )
      flash[:notice] = "You have paid #{@reservation.listing.price}!"
      SendEmailJob.set(wait: 10.seconds).perform_later(@reservation.user, @reservation.listing.user.first_name, @reservation)
      redirect_to '/reservations/show'
    else
      error_message 'reservation not available'
    end
  end

  def show
    @reservation = Reservation.where(user_id: current_user.id).last
    byebug
  end

  def index
    @reservation = Reservation.where(user_id: current_user.id)  
  end

private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :owner, :user_id, :listing_id)
  end

end
