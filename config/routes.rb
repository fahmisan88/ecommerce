Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get :about, to: 'static_pages#about'
  root to:'landing#index'

  resources :users
  resources :items
  resources :carts, only: [:show]
  get :cart, to: "carts#show"
  post :add_item, to: "carts#add_item"
  delete :remove_item, to: "carts#remove_item"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
