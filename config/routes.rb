Rails.application.routes.draw do
  resources :resumes
  resources :users do
    member do
      get :toggle_interface
    end
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' },
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  devise_scope :user do
    get "/users/sign_up/:initial_interface" => 'devise/registrations#new', :as => 'new_user_with_interface'
  end

  resources :companies

  resources :jobs

  get  '/alljobs',      to: 'pages#alljobs'
  get  '/allcompanies', to: 'pages#allcompanies'
  get  '/allresumes',   to: 'pages#allresumes'

  get  'bookmark_resume', to: 'resumes_users#bookmark_resume'
  delete  'unbookmark_resume', to: 'resumes_users#unbookmark_resume'


  root to: "pages#index"

end
