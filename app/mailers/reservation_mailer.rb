class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation)
		@host = host
		@customer = customer
		@reservation = reservation

		mail(to: "zhiyuan0312@gmail.com", subject: "You have received a booking from #{@customer.first_name} #{@customer.last_name}")
	end


end
