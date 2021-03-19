Rails.application.routes.draw do
  root to: 'home#index'
  resources :products do
    resources :reviews, only: [:new, :create]
  end
end
