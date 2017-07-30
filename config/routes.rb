Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :user_trips
  # resources :relations
  # resources :to_dos
#  resources :schedule_details
  resources :searchs
  
  resources :notifications
  resources :trips do
    post "join" => "trips#join_trip"

    resources :budget_trips

    resources :schedules do
      resources :schedule_details
    end
  end 
  resources :regions do
    collection do
      get :all
    end
  end

 resources :schedules, only: [] do
    resources :schedule_details, only: [:create, :destroy]
  end

  resources :places

  post 'trips/:id/invite' => 'trips#invite', as: :trip_invite
  get "trips/:id/confirm_invite" => 'trips#confirm_invite', as: :trip_confirm_invite

  get 'trips/:id/upload_gallery' => 'trips#upload_gallery', as: :trips_upload_gallery

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
