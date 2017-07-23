# Preview all emails at http://localhost:3000/rails/mailers/trip_mailer
class TripMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trip_mailer/trip_invitation
  def trip_invitation
    TripMailer.trip_invitation
  end

end
