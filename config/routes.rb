Rails.application.routes.draw do
  root 'microposts#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: %i[index show] do
    member do
      get :following, :followers
    end
  end

  resource :user do
    resources :microposts, only: %i[new create edit update destroy], module: :users
    resources :profiles, only: %i[show edit update], module: :users
  end

  resources :microposts, only: :index
  resources :relationships, only: %i[create destroy]
end
