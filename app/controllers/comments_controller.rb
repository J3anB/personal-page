class CommentsController < ApplicationController

  def create
    @contact = Contact.find(params[:contact_id])
    @comment = @contact.comments.create(comment_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    if current_user
      @contact = Contact.find(params[:contact_id])
      @comment = @contact.comments.find(params[:id])
      @comment.destroy
      redirect_to contact_path(@contact)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end