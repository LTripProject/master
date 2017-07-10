Rails.application.routes.draw do
  resources :budgets
  resources :notifications
  resources :trips
  resources :regions
  resources :places
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
