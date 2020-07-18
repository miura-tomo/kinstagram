class CreateTrainingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :training_comments do |t|
      t.text :comment
      t.integer :user_id
      t.string :training_id
      t.timestamps
    end
  end
end
