class Check < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates_uniqueness_of :recipe_id, scope: :user_id
end

# validates_uniqueness_ofによって、組み合わせが一つしか存在しないようにb￥バリデーションをかけている
