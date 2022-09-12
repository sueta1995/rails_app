Rails.application.routes.draw do
  resource :session, only: %i[new create]
  resources :users, only: %i[new create]
end
