class AddIndexes < ActiveRecord::Migration
	def change
		add_index :answers, :question_id
		add_index :questions, :survey_id
	end
end
