Rails.application.routes.draw do
  root to: "main#index"

  get 'main/index'
  get 'main/ipl'
  get 'main/contacts'
  get 'main/users'
  get 'main', to: 'main#index'

  get '/users/new', to: 'users#new'
  get '/users/edit', to: 'users#edit'
  get '/users/:user_id', to: 'users#show'

  get '/followings/:user_id', to: 'subscriptions#followings'
  get '/followers/:user_id', to: 'subscriptions#followers'

  get '/questions/:question_id', to: 'questions#show'

  resource :session, only: %i[new create destroy]
  resource :subscription, only: %i[destroy]
  resource :question, only: %i[destroy]
  resource :user, only: %i[destroy]
  resource :nickname, only: %i[update]
  resource :password, only: %i[update]
  resource :comment, only: %i[destroy]
  resources :users, only: %i[new create]
  resources :verifications, only: %i[new create]
  resources :subscriptions, only: %i[new create]
  resources :questions, only: %i[new create]
  resources :comments, only: %i[new create]
end
