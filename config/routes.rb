Rails.application.routes.draw do
  get 'dashboard_user', to: 'dashboard_user#index'
  get 'user_profile', to: 'dashboard_user#user_profile'
  post 'update_profile', to: 'dashboard_user#update_profile'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'landing/index'
  resources :appointment_apps
  get 'record_user', to: 'appointment_apps#record_user'
  put 'appointment_cancel', to: 'appointment_apps#cancel'
  resources :businesses do
    resources :branchoffices do
         resources :atention_schedules
    end
  end

  get 'business/:id', to: 'businesses#show_user'
  devise_for :users , controllers: {
    registrations: 'users/registrations'
  }
  root to: "landing#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
