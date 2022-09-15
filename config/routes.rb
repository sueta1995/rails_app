Rails.application.routes.draw do
  root to: "main#index"
  
  get 'contacts/index'
  get 'contacts', to: 'contacts#index'

  get 'yip/index'
  get 'yip', to: 'yip#index'

  get 'main/index'
  get 'main', to: 'main#index'

  get '/users/new', to: 'users#new'
  get '/users/:user_id', to: 'users#show'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create destroy]
end
