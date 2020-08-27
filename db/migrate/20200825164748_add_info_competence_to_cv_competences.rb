class AddInfoCompetenceToCvCompetences < ActiveRecord::Migration[6.0]
  def change
    add_column :cv_competences, :info_two, :string
    add_column :cv_competences, :info_three, :string
    add_column :cv_competences, :info_four, :string
  end
end
