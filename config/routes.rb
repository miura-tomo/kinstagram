Rails.application.routes.draw do
  devise_for :users

  # devise_scope :user do
  #   delete '/users/sign_out' => 'devise/sessions#destroy'
  # end

# post=投稿　投稿に対して　いいね　コメント機能が存在する親子関係（ネスト）
  root 'posts#top'
  resources :posts, only: [:top, :new, :create, :index, :show, :destroy, :edit, :update] do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
 end
   resources :users, only: [:show, :edit, :update]
end