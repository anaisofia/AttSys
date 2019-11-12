Rails.application.routes.draw do
  resources :courses_users
  resources :teachers
  resources :levels
  resources :courses
  resources :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end