Rails.application.routes.draw do
  root 'users/microposts#index'
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
    resources :microposts, only: %i[index new create edit update destroy], module: :users do
      resources :likes, only: %i[create destroy], module: :microposts
    end
    resource :profile, only: %i[show edit update], module: :users
    resources :relationships, only: %i[create destroy], module: :users
  end
end
