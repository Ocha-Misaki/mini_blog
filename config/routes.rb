Rails.application.routes.draw do
  resources :blogs
  root 'microposts#index'
  resources :microposts
end
