Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout' }

  resources :portfolios

  resources :blogs do
  	put :sort, on: :collection
  end
  
  root to: 'pages#home'

end
