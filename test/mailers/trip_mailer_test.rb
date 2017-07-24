require 'test_helper'

class TripMailerTest < ActionMailer::TestCase
  test "trip_invitation" do
    mail = TripMailer.trip_invitation
    assert_equal "Trip invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
