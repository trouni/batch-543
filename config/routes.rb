Rails.application.routes.draw do
  resources :restaurants
  devise_for :users
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
