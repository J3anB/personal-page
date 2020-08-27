class AddCvLinkToCvCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cv_cards, :link, :string
  end
end
