class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)


    prepared_message = MessagePreparatorService.prepare_message(@room_message, current_user)
    RoomChannel.broadcast_to(@room, prepared_message)

    render status: 200, json: {message: 'it is Okay'}

  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

end


#boreadcast_to => action cable