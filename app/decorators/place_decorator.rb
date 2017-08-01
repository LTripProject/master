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

end
