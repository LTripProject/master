# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
20.times do |index|
  users << User.create(
      email: FFaker::Internet.email,
      password: "password-#{index}",
      password_confirmation: "password-#{index}"
  )
end

unless Region.any?
  Region_BMV = Region.create(name: 'Buôn Ma Thuột')
  Region_CAH = Region.create(name: 'Cà Mau')
  Region_VCA = Region.create(name: 'Cần Thơ')
  Region_VCS = Region.create(name: 'Côn Đảo')
  Region_VCL = Region.create(name: 'Chu Lai')
  Region_DLI = Region.create(name: 'Đà Lạt')
  Region_DAD = Region.create(name: 'Đà Nẵng')
  Region_DIN = Region.create(name: 'Điện Biên')
  Region_VDH = Region.create(name: 'Đồng Hới')
  Region_HAN = Region.create(name: 'Hà Nội')
  Region_HPH = Region.create(name: 'Hải Phòng')
  Region_HUI = Region.create(name: 'Huế')
  Region_CXR = Region.create(name: 'Nha Trang')
  Region_PXU = Region.create(name: 'Pleiku')
  Region_PQC = Region.create(name: 'Phú Quốc')
  Region_UIH = Region.create(name: 'Quy Nhơn')
  Region_VKG = Region.create(name: 'Rạch Giá')
  Region_SGN = Region.create(name: 'Hồ Chí Minh')
  Region_VII = Region.create(name: 'Vinh')
  Region_TBB = Region.create(name: 'Tuy Hòa')
  Region_THD = Region.create(name: 'Thanh Hóa')
end