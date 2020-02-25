Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :testsessions, only: :create
  resources :task, only: [:new, :create, :edit, :update, :destroy] do
    resources :comment, except: :index
  end
  resources :groups, only: [:new, :create, :edit, :update]
end
