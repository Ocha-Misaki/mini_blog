Rails.application.routes.draw do
  devise_for :users
  root 'microposts#index'
  resources :microposts
end
