users = []
unless User.any?
  20.times do |index|
    users << User.create(
        email: FFaker::Internet.email,
        password: "password-#{index}",
        password_confirmation: "password-#{index}"
    )
  end
end

unless Place.any?
  Concerns::SeedPlaces.new().run
end