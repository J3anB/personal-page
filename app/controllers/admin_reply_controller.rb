class AdminReplyController < ApplicationController

  def create
    @contact = Contact.find(params[:id])
    @reply = @contact.create_admin_reply(reply_params)
    redirect_to contact_path(@contact)
    ReplyMailer.with(contact: @contact).reply_email.deliver_now
  end


  private

  def reply_params
    params.require(:reply).permit(:text)
  end
end
