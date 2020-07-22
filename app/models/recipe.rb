class Recipe < ApplicationRecord
  belongs_to :user
  has_many :checkes, dependent: :destroy
  attachment :image
end
