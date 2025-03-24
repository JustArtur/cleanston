Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products, only: %i[index show]

  resources :cart_items, only: %i[create index update destroy] do
    patch :update_quantity, on: :member
  end

  resources :orders, only: %i[create]
end
