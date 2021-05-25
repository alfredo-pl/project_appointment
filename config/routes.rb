Rails.application.routes.draw do
  resources :branchoffices
  resources :businesses
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
