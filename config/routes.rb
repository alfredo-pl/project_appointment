Rails.application.routes.draw do
  get 'dashboard_user', to: 'dashboard_user#index'
  get 'user_profile', to: 'dashboard_user#user_profile'
  post 'update_profile', to: 'dashboard_user#update_profile'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'landing/index'
  resources :appointment_apps
  post 'create_appointment', to: 'appointment_apps#create_appointment_ajax'
 
 
  get 'record_user', to: 'appointment_apps#record_user'

  get 'appointments_branchoffices/:id', to: 'branchoffices#appointments_branchoffices'
  get 'available_slots/:id/:date', to: 'branchoffices#available_slots'
  put 'appointment_cancel', to: 'appointment_apps#appointment_cancel'
  
  
  resources :businesses do
    resources :branchoffices do
         resources :atention_schedules
    end
  end

  get 'dashboard_business', to: 'businesses#dashboard_business'
  devise_for :users , controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: "landing#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
