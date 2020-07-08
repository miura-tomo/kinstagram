Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
 end
   resources :users, only: [:show]
end