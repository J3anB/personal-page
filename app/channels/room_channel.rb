class RoomChannel < ApplicationCable::Channel

  def subscribed
    @room = Room.find params[:room]
    broadcast_to(@room, {new_user: current_user})
    stream_for @room
  end

  def receive(data)
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: data['body']


    prepared_message = MessagePreparatorService.prepare_message(@room_message, current_user)
    RoomChannel.broadcast_to(@room, prepared_message)
  end

end