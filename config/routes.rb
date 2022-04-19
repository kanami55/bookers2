Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

end
