class TripMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trip_mailer.trip_invitation.subject
  #
  def trip_invitation(inviter, receiver , trip, invite_token)
    @receiver = receiver
    @inviter = inviter
    @trip = trip
    @invite_token = invite_token

    mail to: receiver.email, subject: "Invitation"
  end
end
