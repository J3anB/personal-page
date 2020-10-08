class CreatePrivateRoomTable < ActiveRecord::Migration[6.0]
  def change
    create_table :private_users_rooms, id: false do |t|
      t.belongs_to :rooms
      t.belongs_to :users
    end
  end
end
