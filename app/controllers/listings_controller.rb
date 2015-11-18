require 'byebug'

class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    @reservations = Reservation.where(owner: current_user.id)
  end

  def show
    @listing = Listing.find(params[:id])
    
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    redirect_to '/'
  end

  def index_all
    @listings = Listing.all
  end

  private
    def listing_params
      params.require(:listing).permit(:list_name, :description, :bedrooms, :bathrooms, :beds, :property_type, :room_type, :accomodates, :location, :price, :user_id, {pictures: []})
  end

  def edit
  end

  def update
  end

  def destroy
  end
end