class CreateLoves < ActiveRecord::Migration[5.2]
	def change
		create_table :loves do |t|
			t.integer :user_id
			t.integer :training_id

			t.timestamps
		end
	end
end
