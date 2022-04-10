Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'
  resources :users, only: [:new, :index, :show, :edit]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
end
