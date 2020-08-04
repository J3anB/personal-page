class ReplyMailer < ApplicationMailer

  def reply_email
    @contact = params[:contact]
    mail(to: @contact.email, subject: "New message from Jean  #{@contact.admin_reply.text}")
  end
end
