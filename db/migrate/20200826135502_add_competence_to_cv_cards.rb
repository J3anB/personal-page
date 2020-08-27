class AddCompetenceToCvCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cv_cards, :competence_two, :string
    add_column :cv_cards, :competence_three, :string
    add_column :cv_cards, :competence_four, :string
    add_column :cv_cards, :competence_five, :string
  end
end
