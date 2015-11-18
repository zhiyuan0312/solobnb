module ReservationsHelper
	def reserved_dates(listing_id)
		dates = []
		reservations = Reservation.where(listing_id: listing_id)
		reservations.each do |x|
			dates += (x.start_date..x.end_date).map(&:to_s)
		end
	dates
	end
end
