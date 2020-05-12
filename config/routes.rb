Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:new]
  root 'events#index'
end
