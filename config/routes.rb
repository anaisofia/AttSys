Rails.application.routes.draw do
  resources :lessons
  resources :statuses
  resources :courses_users
  resources :levels
  resources :courses

  devise_for :users
    get 'users/:id' => 'users#show', as: :user
  # resources :users

  devise_for :teachers
    get 'teachers/:id' => 'teachers#show', as: :teacher
  # resources :teachers

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
