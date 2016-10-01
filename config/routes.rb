Rails.application.routes.draw do
  devise_for :users
    root to: 'home#index'
  resources :users, only: [:show]
  get 'users/:username' => 'users#show'
  resources :posts, only: [:new, :create, :show]
end
