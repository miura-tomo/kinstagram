Rails.application.routes.draw do
  devise_for :users

  root 'posts#top'
  resources :posts, only: [:top, :new, :create, :index, :show, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
 end
   resources :users, only: [:show, :edit, :update]
end