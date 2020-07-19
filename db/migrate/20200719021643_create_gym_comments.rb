class CreateGymComments < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :gym_image_id

      t.timestamps
    end
  end
end
