class AddInfofiveCompetenceToCvCompetences < ActiveRecord::Migration[6.0]
  def change
    add_column :cv_competences, :info_five, :string
  end
end
