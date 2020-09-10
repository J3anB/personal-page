class AddContentFieldToCvCompetences < ActiveRecord::Migration[6.0]
  def change
    add_column :cv_competences, :content, :string
  end
end
