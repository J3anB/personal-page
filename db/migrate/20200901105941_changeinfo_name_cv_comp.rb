class ChangeinfoNameCvComp < ActiveRecord::Migration[6.0]
  def change
    rename_column :cv_competences, :info, :info_one
  end
end
