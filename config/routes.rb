Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :user_trips
  # resources :relations
  # resources :to_dos
#  resources :schedule_details
  resources :searchs
  resources :home do
    collection do
      get :about
    end
  end

  resources :notifications
  resources :trips do
    post "join" => "trips#join"
    post 'update_video_link' => "trips#update_video_link"
    member do
      get :clone
    end
    resources :budget_trips

    resources :schedules do
      resources :schedule_details
    end
  end 
  resources :regions do
    collection do
      get :all
      get :get_regions
      get :get_destinations
    end
  end

 resources :schedules, only: [] do
    resources :schedule_details, only: [:create, :destroy, :delete]
    member do
      post :sort
    end
  end

  resources :places do
    collection do
      get :all
      get :loadDatabase
      get :fetch_places_foreach_region
      get :fetch_photo_manual
    end
  end

  post 'trips/:id/invite' => 'trips#invite', as: :trip_invite
  get "trips/:id/confirm_invite" => 'trips#confirm_invite', as: :trip_confirm_invite

  get 'trips/:id/upload_gallery' => 'trips#upload_gallery', as: :trips_upload_gallery
  post 'trips/:id/add_photos' => 'trips#add_photos', as: :trips_add_photos

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Facebook::Messenger::Server, at: "bot"
end
