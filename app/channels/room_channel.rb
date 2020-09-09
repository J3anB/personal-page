class RoomChannel < ApplicationCable::Channel

  def subscribed
    @room = Room.find params[:room]

    redis = Redis.new(:url => ENV.fetch("REDISTOGO_URL"){ "redis://localhost:6379/1" })
    room_users = redis.hmget("rooms", @room.id)
    if room_users.first.nil?
      current_room_users = []
    else
      current_room_users = JSON.parse(room_users.first)
    end

    current_room_users << current_user.username

    redis.hset('rooms', @room.id, current_room_users.to_json)

    stream_for @room

    broadcast_to(@room, {new_user: current_user, all_users: current_room_users})
  end

  def receive(data)
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: data['body']


    prepared_message = MessagePreparatorService.prepare_message(@room_message, current_user)
    RoomChannel.broadcast_to(@room, prepared_message)
  end

  def unsubscribed
    redis = Redis.new(:url => ENV.fetch("REDISTOGO_URL"){ "redis://localhost:6379/1" })
    room_users = redis.hmget("rooms", @room.id)
    current_room_users = JSON.parse(room_users.first)

    current_room_users.delete(current_user.username)
    redis.hset('rooms', @room.id, current_room_users.to_json)
    broadcast_to(@room, {new_user: current_user, all_users: current_room_users})
  end

end


# pubsub = ActionCable.server.pubsub
#
#
#
# channel_with_prefix = pubsub.send(:channel_with_prefix, RoomChannel.channel_name)
#
# channels = pubsub.send(:redis_connection).
#     pubsub('channels', "#{channel_with_prefix}:*")
#
#
# subscriptions = channels.map do |channel|
#   Base64.decode64(channel.match(/^#{Regexp.escape(channel_with_prefix)}:(.*)$/)[1])
# end
#
# gid_uri_pattern = /^gid:\/\/.*\/#{Regexp.escape(Room.name)}\/(\d+)$/
# chat_ids = subscriptions.map do |subscription|
#   subscription.match(gid_uri_pattern)
#   # compacting because 'subscriptions' include all subscriptions made from RoomChannel,
#   # not just subscriptions to Room records
# end.compact.map { |match| match[1] }
#
# p chat_ids
