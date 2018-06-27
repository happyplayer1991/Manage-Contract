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
  resources :job_types, except: :index
  resources :job_areas, except: :index
  resources :keywords,  except: :index

  get     '/alljobs',           to: 'pages#alljobs'
  get     '/allcompanies',      to: 'pages#allcompanies'
  get     '/allresumes',        to: 'pages#allresumes'
  get     '/admin',             to: 'pages#admin'
  get     '/settings',          to: 'pages#settings'
  get     '/alert',             to: 'pages#alert'
  get     '/subscribed_jobs',   to: 'pages#subscribed_jobs'

  get     'bookmark_resume',    to: 'bookmarked_resumes#bookmark_resume'
  delete  'unbookmark_resume',  to: 'bookmarked_resumes#unbookmark_resume'
  get     'bookmarked_resumes', to: 'resumes#bookmarked_resumes'

  get     'bookmark_job',       to: 'bookmarked_jobs#bookmark_job'
  delete  'unbookmark_job',     to: 'bookmarked_jobs#unbookmark_job'
  get     'bookmarked_jobs',    to: 'jobs#bookmarked_jobs'

  get     'apply_job',          to: 'applied_jobs#apply_job'
  get     'applied_jobs',       to: 'jobs#applied_jobs'
  get     'applicants/:id',     to: 'jobs#applicants', as: 'job_applicants'

  root                          to: 'pages#index'

end
