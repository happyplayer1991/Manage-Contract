Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/users/auth/facebook/callback', to: redirect('/accounts/auth/facebook/callback')

  resources :jobs

  resources :users, only: [:show]

  root to: "jobs#index"
end
