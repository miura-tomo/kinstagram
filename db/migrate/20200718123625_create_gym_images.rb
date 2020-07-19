class CreateGymImages < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_images do |t|
      t.text :gym_name
      t.string :image_id
      t.text :intro
      t.integer :user_id

      t.timestamps
    end
  end
end
