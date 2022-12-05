Rails.application.routes.draw do
  root to: "main#index"

  get 'main/index'
  get 'main/ipl'
  get 'main/contacts'
  get 'main/users'
  get 'main', to: 'main#index'

  get '/users/new', to: 'users#new'
  get '/users/:user_id', to: 'users#show'

  get '/followings/:user_id', to: 'subscriptions#followings'
  get '/followers/:user_id', to: 'subscriptions#followers'

  resource :session, only: %i[new create destroy]
  resource :subscription, only: %i[destroy]
  resources :users, only: %i[new create destroy]
  resources :verifications, only: %i[new create]
  resources :subscriptions, only: %i[new create]
  resources :questions, only: %i[new create destroy]
end
