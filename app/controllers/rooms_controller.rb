class RoomsController < ApplicationController
  before_action :load_entities

  def index
    @rooms = Room.all
  end

  def show
    @room_message = RoomMessage.new room: @room
    @current_room_messages = @room.room_messages.includes(:user).map do |message_with_user|
      MessagePreparatorService.prepare_message(message_with_user, message_with_user.user)
    end
    #    envoyer un tableau de hash => dans la vue on peut faire une itération
    #map on fait une itération et on renvoie ce que l'on souhaite à chaque itération, =>
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
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

end
