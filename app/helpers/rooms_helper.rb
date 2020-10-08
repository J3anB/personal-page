module RoomsHelper

  def dispatch_rooms
    Room.includes(:users).where(users: {id: nil}).or(
        Room.includes(:users).where(users: {id: current_user.id})
    )
  end

end
