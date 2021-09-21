Rails.application.routes.draw do

  get 'tops/index' => 'tops#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :drivings do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :comments
  resources :likes
  
  root 'tops#index'
end
