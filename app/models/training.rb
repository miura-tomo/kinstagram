class Training < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :training_comments, dependent: :destroy
  has_many :loves, dependent: :destroy, class_name: "Love"

  def loved_by?(user)
    loves.where(user_id: user.id).exists?
  end
end
