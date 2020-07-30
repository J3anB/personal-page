class CreateAdminReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_replies do |t|
      t.text :text

      t.timestamps
    end
  end
end
