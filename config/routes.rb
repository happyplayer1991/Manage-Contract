Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  root to: "pages#home"
end
