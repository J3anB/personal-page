class ChangePrivateUsersRoomsColumnsNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :private_users_rooms, :rooms_id, :room_id
    rename_column :private_users_rooms, :users_id, :user_id
  end
end
