class RemoveInfoColumnsFromCvCompetences < ActiveRecord::Migration[6.0]
  def change
    remove_column :cv_competences, :info_one
    remove_column :cv_competences, :info_two
    remove_column :cv_competences, :info_three
    remove_column :cv_competences, :info_four
    remove_column :cv_competences, :info_five
  end
end
