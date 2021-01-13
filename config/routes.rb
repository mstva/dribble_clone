Rails.application.routes.draw do

  root to: 'shots#index'

  resources :shots do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show]

  # devise_for :users

  devise_scope :user do
    # registrations
    get 'cancel', to: 'users/registrations#cancel', as: :cancel_user_registration
    get 'register', to: 'users/registrations#new', as: :new_user_registration
    get 'edit', to: 'users/registrations#edit', as: :edit_user_registration
    patch '', to: 'users/registrations#update', as: :user_registration
    put '', to: 'users/registrations#update'
    delete '', to: 'users/registrations#destroy'
    post '', to: 'users/registrations#create'

    # session
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session

    # password
    get 'password/new', to: 'devise/passwords#new', as: :new_user_password
    get 'password/edit', to: 'devise/passwords#edit', as: :edit_user_password
    patch 'password', to: 'devise/passwords#update', as: :user_password
    put 'password', to: 'devise/passwords#update'
    post 'password', to: 'devise/passwords#create'
  end
end