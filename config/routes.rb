Rails.application.routes.draw do
  resources :regions
  resources :places
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
