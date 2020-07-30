class AdminRepliesController < ApplicationController

  def create
    @contact = Contact.find(params[:id])
    @reply = @contact.admin_replies.create(reply_params)
    redirect_to contact_path(@contact)
  end

    # def create
  #   contact = Contact.find(params[:id])
  #   @reply = AdminReply.new
  #   @reply.contact = contact
  #   @reply.text = params[:reply][:text]
  #   @reply.save
  #   redirect_to contact_path(@contact)
  # end

  private

  def reply_params
    params.require(:reply).permit(:text)
  end
end
