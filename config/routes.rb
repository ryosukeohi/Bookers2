Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :edit, :update, :index]
end