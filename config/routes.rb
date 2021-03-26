Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :products do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, except: [:new, :create]
end
