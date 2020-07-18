class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.text :training_name
      t.string :image_id
      t.text :explain
      t.integer :user_id

      t.timestamps
    end
  end
end
