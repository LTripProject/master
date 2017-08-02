class PlacesController < ApplicationController
  def index
  end

  def all
    render json: Place.all
  end

  def show
    @place = Place.find(params[:id])
    @photos = @place.photos
    @relative_places = @place.relative_places.limit(3)
  end

  def map_url
    GoogleApiClient.get_map_frame(self.location_id)
  end

  def loadDatabase
    region_names = GoogleApiClient.get_all_regions
    Region.transaction do
      region_names.each do |name|
        location = search_region_location(name)
        Region.create(name: name, latitude: location['lat'], longitude: location['lng'])
      end
    end
  end

  def search_region_location(region)
    response = GoogleApiClient.search_address(region)
    response['results'][0]['geometry']['location']
  end

  def fetch_places_foreach_region
    # Region.order('id DESC')
    Region.all.each do |region|
      puts "#{region.id} - #{region.name}"
      results = GoogleApiClient.get_nearby_places(region.latitude, region.longitude)['results']
      puts results
      create_places(results, region.id)
    end
  end

  def create_places(results, region_id)
    Place.transaction do
      results.each do |result|
        place = Place.create(
          name: result['name'],
          latitude: result['geometry']['location']['lat'],
          longitude: result['geometry']['location']['lng'],
          region_id: region_id,
          rating: result['rating'],
          location_id: result['place_id']
          )
        puts "#{place.name}"
        fetch_photos(place)
      end
    end
  end

  def fetch_photos(place)
    place_detail = GoogleApiClient.search_place_detail(place.location_id)['results']
    Photo.transaction do
      place_detail['photos'].each do |photo|
        place.photos.create(
          width: photo['width'],
          height: photo['height'],
          photo_reference: photo['photo_reference'],
          )
        puts "#{place.name} - #{photo['photo_reference']}"
      end
    end if place_detail['photos']
  end

  def fetch_photo_manual()
    Place.all.each_with_index do |place,i|
      puts "#{place.id} - #{place.name}"

      place_detail = GoogleApiClient.search_place_detail(place.location_id)['result']
      Photo.transaction do
        place_detail['photos'].each do |photo|
          place.photos.create(
            width: photo['width'],
            height: photo['height'],
            photo_reference: photo['photo_reference'],
            )
        end
      end if place_detail['photos']
    end
  end

end
