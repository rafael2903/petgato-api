Rails.application.routes.draw do
  resources :contacts, only: [:index, :show, :create, :destroy]

  Rails.application.routes.draw do
    resources :users, param: :_name
    post '/auth/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
  end
  
end
