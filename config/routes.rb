Rails.application.routes.draw do
  get 'dashboard_user', to: 'dashboard_user#index'
  get 'userProfile', to: 'dashboard_user#userProfile'
  post 'updateProfile', to: 'dashboard_user#updateProfile'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'landing/index'
  resources :appointment_apps
  resources :atention_schedules
  resources :branchoffices
  resources :businesses
  devise_for :users , controllers: {
    registrations: 'users/registrations'
  }
  root to: "landing#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
