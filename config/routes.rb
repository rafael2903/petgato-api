Rails.application.routes.draw do
  resources :contacts, only: [:index, :show, :create, :destroy]
  resources :users
  post '/recovery', to: 'users#password_reset'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  
end
