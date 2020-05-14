Rails.application.routes.draw do
  devise_for :users
  resources :events
  root 'events#index'
  resources :users
  resources :charges
  resources :attendances
end
