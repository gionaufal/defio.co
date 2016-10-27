Rails.application.routes.draw do
  devise_for :users
    root to: 'home#index'
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  get 'users/:username' => 'users#show' do
    member do
      get :following, :followers
    end
  end
  resources :posts, only: [:new, :create, :show, :destroy]
  resources :relationships, only: [:create, :destroy]
end
