Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get :about, to: 'static_pages#about'
  get :contact, to: 'static_pages#contact'
  root to:'landing#index'

  resources :ordered_items, only: [:create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :categories
  resources :items
  resources :carts, only: [:show]
  resources :orders, only: [:show, :create]
  resources :checkouts, only: [:new, :create]


  get :cart, to: "carts#show"
  post :add_item, to: "carts#add_item"
  delete :remove_item, to: "carts#remove_item"
  patch :update_item, to: "carts#update_item"

  match 'auth/:provider/callback', to: 'facebook#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'facebook#destroy', as: 'signout', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/webhooks', controller: :webhooks do
    post 'payment-callback', to: 'webhooks#payment_callback', as: :payment_callback
  end
end
