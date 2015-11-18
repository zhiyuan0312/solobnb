# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
	def booking_email_preview
		ReservationMailer.booking_email(User.first, User.last, Listing.last.list_name)
	end
end
