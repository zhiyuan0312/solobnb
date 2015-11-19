class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(customer, host, reservation)
    # Do something later
    @customer = customer
    @host = host
    @reservation = reservation

    ReservationMailer.booking_email(@customer, @host, @reservation).deliver_later
  end
end
