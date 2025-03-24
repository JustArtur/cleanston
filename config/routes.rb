Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products, only: %i[index show]

  resources :cart_items, only: %i[create index update] do
    member do
      post :clear
      post :add
    end
  end
end
