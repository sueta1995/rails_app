Rails.application.routes.draw do
  get 'yip/index'
  get 'main/index'

  get 'main', to: 'main#index'
  get 'yip', to: 'yip#index'

  resource :session, only: %i[new create]
  resources :users, only: %i[new create]

  root :to => "main#index"
end
