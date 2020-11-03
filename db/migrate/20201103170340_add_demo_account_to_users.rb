class AddDemoAccountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :demo_account, :boolean, default: false
  end
end
