Rails.application.routes.draw do
  root 'microposts#index'
  resources :microposts
end
