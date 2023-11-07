Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'microposts#index'
  resources :users, only: %i[index show]
  resources :microposts
end
