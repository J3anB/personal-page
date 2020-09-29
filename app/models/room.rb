class Room < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :private_users_rooms
  has_many :room_messages, dependent: :destroy, inverse_of: :room
end
