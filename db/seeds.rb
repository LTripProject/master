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

unless Region.any?
  Concerns::SeedRegions.new().run
end