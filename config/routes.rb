Rails.application.routes.draw do
  devise_for :users

  root 'events#index'
  resources :users
  resources :charges
  resources :attendances
  resources :template

  resources :events do
    resources :avatars, only: [:create]
  end
end
