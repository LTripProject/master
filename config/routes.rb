Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  
  resources :user_trips
  resources :relations
  resources :to_dos
  resources :schedule_details
  resources :budgets
  resources :notifications
  resources :trips
  resources :regions
  resources :places
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
