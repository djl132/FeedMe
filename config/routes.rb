Rails.application.routes.draw do
  # get 'page/index'

# NAMESPACE THE PATH

# WHAT WOULD BE the point of namespacing a path and not a controller?
  scope path: '/feeds', as: 'feed' do
    # get 'user/:id', to: 'feeds#user', as: 'user'
    get 'me', to: 'feeds#user'
    get 'flat', to: 'feeds#flat'
    get 'aggregated', to: 'feeds#aggregated'
    get 'notification', to: 'feeds#notification'
  end


  resources :items, only: [:new, :create]

  resources :pins, only: [:create, :destroy]

  resources :users, only: [:index]

  resources :follows, only: [:create, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

end
