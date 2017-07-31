class PlaceDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  delegate_all

  def map_url
    GoogleApiClient.get_map_frame(object.location_id)
  end

  def suggest_title
    "#{object.name} - #{object.region.name}"
  end

  def display_image_url(height = nil)
    if object.photo
      object.photo.url(height)
    else
      'https://www.mariecuriealumni.eu/sites/default/files/styles/50x50_avatar/public/pictures/picture-default.jpg?itok=uk4ugbrt'
    end
  end

end
