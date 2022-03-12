Rails.application.routes.draw do
  root to: 'landing_page#show'

  resource :about, only: :show
  resources :facilities, only: :index
end
