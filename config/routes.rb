Rails.application.routes.draw do
  resources :portfolios
  resources :blogs
  
  root to: 'pages#home'

end
