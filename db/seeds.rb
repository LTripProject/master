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
  Region.create! [
  { 
    name: "An Giang",
    latitude: '10.5215836',
    longitude: '105.1258955'
  },
  { 
    name: "Bà Rịa - Vũng Tàu",
    latitude: '10.5417397',
    longitude: '107.2429976'
  },
 {
    name: "Bắc Giang",
    latitude: '21.3014947',
    longitude: '106.6291304'
  },
 {
  name: 'Bắc Kạn',
  latitude: '22.3032923',
  longitude: '105.876004'
  },
 {
  name: "Bạc Liêu",
  latitude: '9.2515555',
  longitude: '105.5136472'
  },
  {
   name: "Bắc Ninh",
   latitude: '21.121444',
  longitude: '106.1110501'
  },
   {
    name: "Bến Tre",
    latitude: '10.1081553',
    longitude: '106.4405872'
  },
  {
    name: "Bình Dương",
   latitude: '11.3254024',
   longitude: '106.477017'
  },
  {
    name: "Bình Phước",
    latitude: '11.7511894',
    longitude: '106.7234639'
  },
  {
    name: "Bình Thuận",
    longitude: '10.9804603',
    latitude: '108.2614775'
  },
  {
    name: "Bình Định",
    longitude: '13.7829673',
    latitude: '109.2196634'
  },
  {
    name: "Cà Mau",
    longitude: '8.9624099',
    latitude: '105.1258955'
  },
  {
    name: "Cần Thơ",
    longitude: '10.0451618',
    latitude: '105.7468535'
  },
  {
    name: "Cao Bằng",
    longitude: '22.635689',
    latitude: '106.2522143'
  },
  {
    name: "Gia Lai",
    longitude: '13.8078943',
    latitude: '108.109375'
  },
  {
    name: "Hà Giang",
    longitude: '22.7662056',
    latitude: '104.9388853'
  },
  {
    name: "Hà Nam",
    longitude: '20.5835196',
    latitude: '105.92299'
  },
  {
    name: "Hà Nội",
    longitude: '21.0031177',
    latitude: '105.8201408'
  },
  {
    name: "Hà Tĩnh",
    longitude: '18.2943776',
    latitude: '105.6745247'
  },
  {
    name: "Hải Dương",
    longitude: '20.9385958',
    latitude: '106.3206861'
  },
  {
    name: "Hải Phòng",
    longitude: '20.8449115',
    latitude: '106.6880841'
  },
  {
    name: "Hậu Giang",
    longitude: '9.757898',
    latitude: '105.6412527' 
  },
  {
    name: "Hồ Chí Minh",
    longitude: '10.8230989',
    latitude: '106.6296638'
  },
  {
    name: "Hoà Bình",
    longitude: '20.6861265',
    latitude: '105.3131185'
  },
  {
    name: "Hưng Yên",
    longitude: '20.8525711',
    latitude: '106.0169971'
  },
  {
    name: "Khánh Hòa",
    longitude: '12.2585098',
    latitude: '109.0526076'
  },
  {
    name: "Kiên Giang",
    longitude: '9.8249587',
    latitude: '105.1258955'
  },
  {
    name: "Kon Tum",
    longitude: '14.661167',
    latitude: '107.83885'
  },
 {
    name: "Lai Châu",
    longitude: '22.3686613',
    latitude: '103.3119085'  
 },
  {
    name: "Lâm Đồng",
    longitude: '11.9404192',
    latitude: '108.4583132'
  },
  {
    name: "Lạng Sơn",
    longitude: '21.8563705',
    latitude: '106.6291304'
  },
  {
    name: "Lào Cai",
    longitude: '22.3380865',
    latitude: '104.1487055'    
  },
  {
    name: "Long An",
    longitude: '10.5330098',
    latitude: '106.4052541'
  },
  {
    name: "Nam Định",
    longitude: '20.2791804',
    latitude: '106.2051484'
  },
  {
    name: "Nghệ An",
    longitude: '19.2342489',
    latitude: '104.9200365'
  },
  {
    name: "Ninh Bình",
    longitude: '20.2129969',
    latitude: '105.92299'
  }, 
  {
    name: "Ninh Thuận",
    longitude: '11.6738767',
    latitude: '108.8629572'
  },
  {  
    name: "Phú Thọ",
    longitude: '21.268443',
    latitude: '105.2045573'
  },
  {
    name: "Phú Yên",
    longitude: '13.0881861',
    latitude: '109.0928764'
  },
  {
    name: "Quảng Bình",
    longitude: '17.4659391',
    latitude: '106.5983958'
  },
  {
    name: "Quảng Nam",
    longitude: '15.5393538',
    latitude: '108.019102'
  },
  {
    name: "Quảng Ngãi",
    longitude: '15.0759838',
    latitude: '108.7125791'
  },
  {
    name: "Quảng Ninh",
    longitude: '21.006382',
    latitude: '107.2925144'
  },
  {
    name: "Quảng Trị",
    longitude: '16.7943472',
    latitude: '106.963409'
  },
  {
    name: "Sóc Trăng",
    longitude: '9.6003688',
    latitude: '105.9599539'
  },
  {
    name: "Sơn La",
    longitude: '21.1022284',
    latitude: '103.7289167'
  },
  {
    name: "Tây Ninh",
    longitude: '11.3675415',
    latitude: '106.1192802'
  }, 
  {
    name: "Thái Bình",
    longitude: '20.5386936',
    latitude: '106.3934777'
  },
  {
    name: "Thái Nguyên",
    longitude: '37.87059',
    latitude: '112.548879'
  },
  {
    name: "Thanh Hóa",
    longitude: '20.1291279',
    latitude: '105.3131185'
  },
  {
    name: "Thừa Thiên Huế",
    longitude: '16.467397',
    latitude: '107.5905326'
  },
  {
    name: "Tiền Giang",
    longitude: '10.4493324',
    latitude: '106.3420504'
  },
  {
    name: "Trà Vinh",
    longitude: '9.812741',
    latitude: '106.2992912'
  },
  {
    name: "Tuyên Quang",
    longitude: '22.1726708',
    latitude: '105.3131185'
  },
  {
    name: "Vĩnh Long",
    longitude: '10.0861281',
    latitude: '106.0169971'
  },
  {
    name: "Vĩnh Phúc",
    longitude: '21.3608805',
    latitude: '105.5474373'
  },
  {
    name: "Yên Bái",
    longitude: '21.6837923',
    latitude: '104.4551361'
  },
  {
    name: "Đà Nẵng",
    longitude: '16.0470788',
    latitude: '108.2062293'
  },
  {
    name: "Đắk Lắk",
    longitude: '12.7100116',
    latitude: '108.2377519'
  },
  { 
    name: "Đắk Nông",
    longitude: '12.2646476',
    latitude: '107.609806'
  },
  {
    name: "Điện Biên",
    longitude: '21.8042309',
    latitude: '103.1076525'
  },
  {
    name: "Đồng Nai",
    longitude: '11.0686305',
    latitude: '107.1675976'
  },
  {
    name: "Đồng Tháp",
    latitude: '105.6881788',
    longitude: '10.4937989',
  }]
end

unless Place.any?
  # Concerns::SeedPlaces.new().run
  puts "*"*100
  Region.all.each do |region|
    puts "#{region.id} - #{region.name}"
    results = GoogleApiClient.get_nearby_places(region.latitude, region.longitude)['results']
    puts results
    Place.transaction do
    results.each do |result|
      place = Place.create(
        name: result['name'],
        latitude: result['geometry']['location']['lat'],
        longitude: result['geometry']['location']['lng'],
        region_id: region.id,
        rating: result['rating'],
        location_id: result['place_id']
        )
      puts "#{place.name}"
       place_detail = GoogleApiClient.search_place_detail(place.location_id)['results']
      unless place_detail.blank?
        Photo.transaction do
          place_detail['photos'].each do |photo|
            place.photos.create(
              width: photo['width'],
              height: photo['height'],
              photo_reference: photo['photo_reference'],
              )
            puts "#{place.name} - #{photo['photo_reference']}"
          end
        end 
      end
      # fetch_photos(place)
    end
  end
    # create_places(results, region.id)
  end

 # def create_places(results, region_id)
 #      Place.transaction do
 #        results.each do |result|
 #          place = Place.create(
 #            name: result['name'],
 #            latitude: result['geometry']['location']['lat'],
 #            longitude: result['geometry']['location']['lng'],
 #            region_id: region_id,
 #            rating: result['rating'],
 #            location_id: result['place_id']
 #            )
 #          puts "#{place.name}"

 #          fetch_photos(place)
 #        end
 #      end
 #    end

 #    def fetch_photos(place)
 #      place_detail = GoogleApiClient.search_place_detail(place.location_id)['results']
 #      unless place_detail.blank?
 #        Photo.transaction do
 #          place_detail['photos'].each do |photo|
 #            place.photos.create(
 #              width: photo['width'],
 #              height: photo['height'],
 #              photo_reference: photo['photo_reference'],
 #              )
 #            puts "#{place.name} - #{photo['photo_reference']}"
 #          end
 #        end 
 #      end
 #    end
end