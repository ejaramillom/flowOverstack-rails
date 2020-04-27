Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :vote, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy]
  end
  resources :answers do
    resources :comments, only: [:create, :destroy]
    resource :vote, only: [:create, :destroy]
  end
  root 'posts#index'
end
