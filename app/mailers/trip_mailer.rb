class TripMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trip_mailer.trip_invitation.subject
  #
  def trip_invitation(inviter, receiver , trip)
    @receiver = receiver
    @inviter = inviter
    @trip = trip

    mail to: receiver.email, subject: "Invitation"
  end
end
