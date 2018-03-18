Rails.application.routes.draw do
  devise_for :users
  resources :portfolios
  resources :blogs
  
  root to: 'pages#home'

end
