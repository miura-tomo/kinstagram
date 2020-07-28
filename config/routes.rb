Rails.application.routes.draw do
  get 'kujis/index'
  # お問い合わせフォームから届いたメールを確認するために導入
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :contacts
  get 'loves/create'
  get 'loves/destroy'
  devise_for :users
  # devise_scope :user do
  #   delete '/users/sign_out' => 'devise/sessions#destroy'
  # end
  root 'posts#top'
  # post=投稿　投稿に対して　いいね　コメント機能が存在する親子関係（ネスト）
  resources :posts, only: [:top, :new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :recipes, only: [:index, :show, :new, :create] do
    resource :checkes, only: [:create, :destroy]
  end

  resources :users do
    get :search, on: :collection
  end

  resources :trainings, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :loves, only: [:create, :destroy]
    resources :training_comments, only: [:create, :destroy]
  end



  resources :gym_images, only: [:new, :create, :index, :show, :edit, :update,:destroy] do
    resource :like, only: [:create, :destroy]
    resources :gym_comments, only: [:create, :destroy]
  end

  resources :kujis, only:[:index]

end
