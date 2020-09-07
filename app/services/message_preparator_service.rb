class MessagePreparatorService

  def self.prepare_message(message, user)

    {
        message: message.message,
        message_date: message.created_at.in_time_zone("Europe/Paris").strftime("%d/%m/%Y %H:%M:%S"),
        user: user.username
    }
  end



end