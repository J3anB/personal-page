class RemoveDescriptionFromFormations < ActiveRecord::Migration[6.0]
  def change
    remove_column :formations, :description, :string
  end
end
