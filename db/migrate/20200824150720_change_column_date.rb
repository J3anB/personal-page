class ChangeColumnDate < ActiveRecord::Migration[6.0]
  def change
    change_column :cv_cards, :date, :string
  end
end
