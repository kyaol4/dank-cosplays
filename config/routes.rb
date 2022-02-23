Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :costumes, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update, :show]
  namespace :owner do # puts word owner in fron of bookings_index
    resources :bookings, only: :index
  end
end
