  class NotificationChannel < ApplicationCable::Channel

    def subscribed

      stream_for current_user
    end

    def unsubscribed
      stop_all_streams
    end


    protected
  end




    # def connect
    #   self.current_user = find_verified_user
    #   logger.add_tags 'ActionCable', current_user.name
    # end

    # def find_verified_user
    #   verified_user = User.find_by(id: cookies.signed['user.id'])
    #   if verified_user && cookies.signed['user.expires_at'] > Time.now
    #     verified_user
    #   else
    #     reject_unauthorized_connection
    #   end
