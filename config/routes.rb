Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users, only: [:index, :show, :update]
  resources :products do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, except: [:new, :create]
end
