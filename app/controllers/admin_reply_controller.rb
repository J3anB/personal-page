class AdminReplyController < ApplicationController

  def create
    path = AdminReplyService.save_reply(params[:id], reply_params, request.base_url)
    redirect_to
  end


  private

  def reply_params
    params.require(:reply).permit(:text)
  end
end
