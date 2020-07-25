class Recipe < ApplicationRecord
  belongs_to :user
  has_many :checkes, dependent: :destroy, class_name: "Check"
  attachment :image
end
