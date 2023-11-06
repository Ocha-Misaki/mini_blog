Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root 'microposts#index'
  resources :users, only: %i[index show]
  resources :microposts
end
