class RoomsController < ApplicationController
  before_action :load_entities

  def index
  end

  def show
    @room = Room.includes(:users).find(params[:id])

    @room_message = RoomMessage.new room: @room
    @current_room_messages = @room.room_messages.includes(:user).map do |message_with_user|
      MessagePreparatorService.prepare_message(message_with_user, message_with_user.user)
    end

  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    if room_type_params[:room_type] == 'private_room'
      @room.users = [current_user] + [User.find(room_type_params[:users])]
    end
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def update
    if @rooms.update_attributes(permited_parameters)
      flash[:success] = "Room #{@room.name} has been updated successfully"
      redirect_to rooms_path
    else
      render :'contacts/new'
    end
  end

  def destroy
    Room.find(params[:id]).destroy
    redirect_to rooms_path
  end


  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end

  def room_type_params
    params.require(:room).permit(:room_type, :users)
  end

end
