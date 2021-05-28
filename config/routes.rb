Rails.application.routes.draw do
  get 'landing/index'
  resources :appointment_apps
  resources :atention_schedules
  resources :branchoffices
  resources :businesses
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "landing#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
