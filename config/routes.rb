Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
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

  resources :companies do
    resources :reviews
  end

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

  get     'jobs/:id/apply_by_self_job',  to: 'applied_jobs#apply_by_self_job', as: :apply_by_self_job
  get     'jobs/:id/apply_job',          to: 'applied_jobs#apply_job',     as: :apply_job
  get     'jobs/:id/decline_job',        to: 'applied_jobs#declined_job',  as: :decline_job
  post    '/resumes/:id/invite_to_job/', to: 'applied_jobs#invite_to_job', as: :invite_to_job

  get     'applied_jobs',         to: 'jobs#applied_jobs'
  get     'jobs/:id/applicants/', to: 'jobs#applicants', as: 'job_applicants'
  get     'jobs/:id/invites/',    to: 'jobs#invites', as: 'job_invites'

  root to: 'pages#index'

end
