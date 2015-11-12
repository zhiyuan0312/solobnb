require 'byebug'

class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    byebug
    redirect_to '/'
  end

  private
    def listing_params
      params.require(:listing).permit(:list_name, :description, :bedrooms, :bathrooms, :beds, :property_type, :room_type, :accomodates, :location, :price, :user_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end