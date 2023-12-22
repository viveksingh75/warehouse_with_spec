Rails.application.routes.draw do

  resources :obtain_coupons

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions',
  }
  root to: 'accounts/sessions#new'

namespace :api do
  namespace :v1 do
    resources :obtain_coupons
    resources :warehouses, except: [:new, :edit]
  end
end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
