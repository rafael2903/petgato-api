Rails.application.routes.draw do
  resources :tags
  resources :contacts, only: [:index, :show, :create, :destroy]
  resources :users
  resources :posts
  post '/recovery', to: 'users#password_reset'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  
end
