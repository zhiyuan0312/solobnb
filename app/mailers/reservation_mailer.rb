class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id)
		@host = host
		@customer = customer
		mail(to: @host, subject: "You have received a booking form #{@custome}")
	end
end
