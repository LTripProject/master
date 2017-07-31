class GoogleApiClient
  API_KEY = ENV['GOOGLE_API_KEY']
  API_KEY_2 = ENV['GOOGLE_API_KEY']
  API_KEY_3 = ENV['GOOGLE_API_KEY']
  TYPES = 'zoo|park|museum|shopping_small|cafe|amusement_park|park|movie_theater|art_gallery'
  RADIUS = 20000

  def self.search_address(address)
    params = "?address=#{address}&key=#{API_KEY}"
    get_method('https://maps.googleapis.com/maps/api/geocode/json' + params)
  end

  def self.search_place_detail(place_id)
    params = "?placeid=#{place_id}&key=#{API_KEY_3}"
    get_method('https://maps.googleapis.com/maps/api/place/details/json' + params)
  end

  def self.get_all_regions
    get_method('http://api.tala.xyz/config/data')['regions'].map { |region| region['name'] }
  end

  def self.get_nearby_places(latitude, longitude)
    params = "?location=#{latitude},#{longitude}&type=#{TYPES}&radius=#{RADIUS}&key=#{API_KEY_3}"
    get_method('https://maps.googleapis.com/maps/api/place/nearbysearch/json' + params)
  end

  def self.get_place_photo(photo_reference, height)
    params = "?maxheight=#{height}&photoreference=#{photo_reference}&key=#{API_KEY_2}"
    'https://maps.googleapis.com/maps/api/place/photo' + params
  end

  def self.get_map_frame(place_id)
    params = "?q=place_id:#{place_id}&key=#{API_KEY_2}"
    'https://www.google.com/maps/embed/v1/place' + params
  end

  def self.calculate_distance(origin_latitude, origin_longitude, des_latitude, des_longitude)
    params = "?units=metric&origins=#{origin_latitude},#{origin_longitude}&destinations=#{des_latitude},#{des_longitude}&key=#{API_KEY}"
    get_method('https://maps.googleapis.com/maps/api/distancematrix/json' + params)['rows'][0]['elements'][0]
  end

  private
  def self.get_method(url)
    HTTParty.get(URI.encode(url)).parsed_response
  end
end