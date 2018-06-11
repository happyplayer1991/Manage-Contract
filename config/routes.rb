Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  root to: "jobs#index"
end
