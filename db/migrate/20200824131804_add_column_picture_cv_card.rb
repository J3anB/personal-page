class AddColumnPictureCvCard < ActiveRecord::Migration[6.0]

  def change
    add_column :cv_cards, :picture, :string

  end
end
