Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :companies

  resources :jobs

  get  '/alljobs', to: 'pages#alljobs'
  get  '/allcompanies', to: 'pages#allcompanies'
  
  root to: "pages#index"

end
