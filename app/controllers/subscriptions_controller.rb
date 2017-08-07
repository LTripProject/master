class SubscriptionsController < ApplicationController

  def create
  	puts "**********************create subscription************"
  	encoded_subscription = Base64.urlsafe_encode64(params.fetch(:subscription, {}).to_json)
    session[:subscription] = encoded_subscription
    puts "create subscription #{session[:subscription]}"
    head :ok
  end

  def destroy
    session.delete(:subscription)

    head :ok
  end
end