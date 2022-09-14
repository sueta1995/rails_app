Rails.application.routes.draw do
  root to: "main#index"
  
  get 'contacts/index'
  get 'yip/index'
  get 'main/index'

  get 'main', to: 'main#index'
  get 'yip', to: 'yip#index'
  get 'contacts', to: 'contacts#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
end
