class CreateAdminReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_replies do |t|
      t.text :text
      t.belongs_to :contact, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
