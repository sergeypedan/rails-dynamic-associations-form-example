class AddSurveyIdToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :survey_id, :integer
  end
end
