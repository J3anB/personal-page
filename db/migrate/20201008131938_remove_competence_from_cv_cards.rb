class RemoveCompetenceFromCvCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :cv_cards, :competence_one, :string
    remove_column :cv_cards, :competence_two, :string
    remove_column :cv_cards, :competence_three, :string
    remove_column :cv_cards, :competence_four, :string
    remove_column :cv_cards, :competence_five, :string
  end
end
