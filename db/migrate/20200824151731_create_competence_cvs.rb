class CreateCompetenceCvs < ActiveRecord::Migration[6.0]
  def change
    create_table :cv_competences do |t|
      t.string :title
      t.string :info

      t.timestamps
    end
  end
end
