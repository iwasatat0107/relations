Rails.application.routes.draw do
  devise_for :users
  root to: 'clients#index'
  resources :clients
end
