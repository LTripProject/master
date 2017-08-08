require "facebook/messenger"
include Facebook::Messenger
# include Rails.application.routes.url_helpers

class MessengerCommand
  AVAILABLE_COMMANDs = %w(place trip region help)
  HOST = 'https://ltrip.herokuapp.com'

  def initialize(sender, text)
    @sender = sender
    # @user = User.find_by(uid: @sender['id'])
    
    if @words = text.downcase.try(:split)
      @action = @words[0]
      @command = @words[1]
      @arg = @words.last(@words.size - 2).join(" ") if @words.size > 2
    end
  end

  def execute
    if @action !='get' && !AVAILABLE_COMMANDs.include?(@command)
      missing_args
    else
      send(@command)
    end
  end

  def place
    if @arg
      trips = Trip.joins(:places).where("places.name iLIKE ?", "%#{@arg}%")

      trips.blank? ? not_found : send_trips_link(trips.limit(5))
    else
      missing_args
    end
  end

  def region
    if @arg
      trips = Trip.joins(:regions).where("regions.name iLIKE ?", "%#{@arg}%")
        .distinct

     trips.blank? ? not_found : send_trips_link(trips.limit(5))
    else
      missing_args
    end
  end

  def help
    text = "\t\t### Helper: get <command> <arg> ### \n- To find trip by \n\tPlace: get place <Place Name>\n\tRegion: get region <Region Name>\n- To get top trips have most views: get top <--options>"

    quick_reply(text)
  end

  def places
    not_found
  end

  def trip
    from = @words[2] if @words.size > 3
    arg = @words.last(@words.size - 3).join(" ")

    if from == 'from' && !arg.blank?
      if (date = DateTime.parse(arg) rescue nil)
        trips = Trip.where("start_date >= ?", date)
      else
        trips = Trip.joins(:places).joins(:regions)
          .where("places.name iLIKE ? OR regions.name iLIKE ?", "%#{arg}%", 
            "%#{arg}%")
      end

      trips.blank? ? not_found : send_trips_link(trips.limit(5))
    else
      missing_args
    end

  end

  def top
    limit = @arg || 5
    trips = Trip.order(user_trips_count: :desc).limit(limit)

    trips.blank? ? not_found : send_trips_link(trips)
  end


  private
  def send_trips_link(trips)
    text = @arg.nil? ? "" : "##### #{trips.size} #{'trip'.pluralize(trips.size)} found with: #{@arg.upcase} #####\n"

    trips.each do |trip|
      text += "\n#{trip.title}: #{HOST}/trips/#{trip.id}\n"
    end

    send_as_text(text)
  end

  def quick_reply(text)
    quick_replies = %w(help top)
    send_as_quick_replies(text, quick_replies)
  end

  def missing_args
    text = "Your option unavailable! Type -- get help -- to get more information"

    quick_reply text
  end


  def not_found
    text = "We couldn't find any trip, click link below to see more details ### #{HOST}/trips ### "

    quick_reply text
  end

  def send_as_text(text)
    text = text[0..600] if text.length > 600

    Bot.deliver({
      recipient: @sender,
      message: {
        text: text
      }
    }, access_token: ENV['ACCESS_TOKEN'])
  end

   def send_as_quick_replies(text, args)
    quick_replies = []
    args.each do |title|
      quick_replies << {
        content_type: 'text',
        title: "get #{title}",
        payload: "get #{title}"
      }
    end

    Bot.deliver({
      recipient: @sender,
      message: ({
        text: text,
        quick_replies: quick_replies
      })
    }, access_token: ENV['ACCESS_TOKEN'])
  end
  
end