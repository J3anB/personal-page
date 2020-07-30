class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    change_table :admin_replies do |t|
      t.belongs_to :contact
    end
  end
end
