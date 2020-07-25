class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :training_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_many :loves, dependent: :destroy, class_name: "Love"
  has_many :gym_images, dependent: :destroy
  has_many :gym_comments, dependent: :destroy
  # recipesに対してlike（”いいね”のようなもの）ができる
  has_many :recipes, dependent: :destroy
  has_many :checkes, dependent: :destroy, class_name: "Check"
  # すでにrecipeに対してcheckをしているか？
  def already_checked?(recipe)
    self.checkes.exists?(recipe_id: recipe.id)
  end
end
