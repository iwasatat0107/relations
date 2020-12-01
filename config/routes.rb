Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'clients#index'
  resources :clients do
    resources :memos, only: :create
    resources :checks, only: [:new, :index, :create]
    collection do
      get 'search'
    end
  end
end
