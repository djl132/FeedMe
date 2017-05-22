Rails.application.routes.draw do
  # get 'page/index'

  resources :items, only: [:new, :create]

  resources :pins, only: [:create, :destroy]

  resources :users, only: [:index]

  resources :follows, only: [:create, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

end
