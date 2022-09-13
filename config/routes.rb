Rails.application.routes.draw do
  get 'main/index'

  resource :session, only: %i[new create]
  resources :users, only: %i[new create]

  root :to => "main#index"
end
