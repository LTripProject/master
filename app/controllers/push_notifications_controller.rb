class PushNotificationsController < ApplicationController
  def create
    puts "*****************PushNotificationsController.create***************************"
    subscription_params = fetch_subscription
    puts "subscription_params = #{subscription_params}"
    message = "Hello world, the time is #{Time.zone.now}"
    WebpushJob.perform_later message,
      endpoint: subscription_params[:endpoint],
      p256dh: subscription_params.dig(:keys, :p256dh),
      auth: subscription_params.dig(:keys, :auth)

    head :ok

  end

  private

  def webpush_params
    puts "********************************************"
    subscription_params = fetch_subscription
    message = "Hello world, the time is #{Time.zone.now}"
    endpoint = subscription_params[:endpoint]
    p256dh = subscription_params[:keys][:p256dh]
    auth = subscription_params[:keys][:auth]
    puts "********************************************"
    { message: message, 
      endpoint: endpoint, 
      p256dh: p256dh, 
      auth: auth, 
      vapid: {
        subject: 'mailto:vqdanh.khtn@gmail.com',
        public_key: ENV['VAPID_PUBLIC_KEY'],
        private_key: ENV['VAPID_PRIVATE_KEY']
      }
    }
  end

  def fetch_subscription
    encoded_subscription = session.fetch(:subscription) do
      raise "Cannot create notification: no :subscription in params or session"
    end
    decode_subscription = Base64.urlsafe_decode64(encoded_subscription)
    puts "decode subscription = #{decode_subscription}"
    subscriptionJson = JSON.parse(decode_subscription).with_indifferent_access
    puts "parse json subscription = #{subscriptionJson}"
    return subscriptionJson
  end
end