Rails.application.routes.draw do
  get 'page/index'

  resources :items, only: [:new, :create]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

end
