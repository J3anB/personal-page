class ChangeCompetenceNameCvCardOne < ActiveRecord::Migration[6.0]
  def change
    rename_column :cv_cards, :competence, :competence_one
  end
end
