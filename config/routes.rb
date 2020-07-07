Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :posts, only: [:new, :create, :index, :show] do
   resources :post_comments, only: [:create, :destroy]
 end
end