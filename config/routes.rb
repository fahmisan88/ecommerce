Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get :about, to: 'static_pages#about'
  root to:'landing#index'

  resources :users, only: [:new, :edit, :create, :update]
  resources :items , only: [:index, :show]
  resources :ordered_items, only: [:create, :update, :destroy]
  resource :cart, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
