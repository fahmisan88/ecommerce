Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get :about, to: 'static_pages#about'
  root to:'landing#index'

  resources :users, only: [:new, :edit, :create, :update]
  resources :items , only: [:index, :show]
  resources :ordered_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  match 'auth/:provider/callback', to: 'facebook#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'facebook#destroy', as: 'signout', via: [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
