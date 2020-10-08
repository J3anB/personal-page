class RemoveContentColumnFromCvCompetences < ActiveRecord::Migration[6.0]
  def change
    remove_column :cv_competences, :content, :string
  end
end
