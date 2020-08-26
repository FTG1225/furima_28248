Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :item_purchase
  end
  resources :users, only: [:edit, :update]
end