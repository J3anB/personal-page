class CvCardsController < ApplicationController

  def index
    @cv_cards = CvCard.all
  end

  def show
    @cv_card = CvCard.find(params[:id])
  end

  def new
    @cv_card = CvCard.new
  end

  def edit
    @cv_card = CvCard.find(params[:id])
  end

  def create
    @cv_card = CvCard.new(cv_card_params)
    unless cv_card_file[:file].nil?
      uploaded_file = Cloudinary::Uploader.upload(cv_card_file[:file])
      @cv_card.picture = "#{uploaded_file['public_id']}.#{uploaded_file['format']}"
    end
    if @cv_card.save

      redirect_to @cv_card, notice: "Your CV card #{@cv_card.business} has been created  successfully"
    else
      render 'new'
    end
  end

  def update
    @cv_card = CvCard.find(params[:id])

    if @cv_card.update(cv_card_params)
      redirect_to @cv_card, notice: "your CV card #{@cv_card.business} has been updated successfully"
    else
      render 'edit'
    end
  end


  def destroy
    CvCard.find(params[:id]).destroy
    redirect_to cv_cards_path, notice: "Your CV card has been deleted  successfully"
  end

  def competence_required?(competence_number)
    competence_number == "one"
  end

  helper_method :competence_required?

  private

  def cv_card_params
    params.require(:cv_card).permit(:business, :job, :date, :competence_one, :competence_two, :competence_three, :competence_four, :competence_five, :link)
  end

  def cv_card_file
    params.require(:cv_card).permit(:file)
  end
end
