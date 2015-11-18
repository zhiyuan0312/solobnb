class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user
	validates :start_date, :end_date, :overlap => {:scope => "listing_id"}
end
