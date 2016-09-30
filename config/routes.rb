Rails.application.routes.draw do
  devise_for :users
    root to: 'home#index'
  resources :users, only: [:show]
  get 'users/:username' => 'user#show'
end
