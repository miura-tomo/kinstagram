class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :training_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :trainings, dependent: :destroy
         has_many :loves, dependent: :destroy, class_name: "Love"
         has_many :gym_images, dependent: :destroy
         has_many :gym_comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         attachment :profile_image

         validates :name, presence: true
end
