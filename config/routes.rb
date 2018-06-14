Rails.application.routes.draw do
  resources :users, only: [:show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :companies

  resources :jobs

  root to: "pages#index"

  get  '/alljobs', to: 'pages#alljobs'
  get  '/allcompanies', to: 'pages#allcompanies'

end
