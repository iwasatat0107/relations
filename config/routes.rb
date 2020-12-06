Rails.application.routes.draw do
  get 'users/show'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'clients#index'
  resources :clients do
    resources :memos, only: [:create, :destroy]
    resources :checks, only: [:new, :index, :create]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
