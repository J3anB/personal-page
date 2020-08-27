class CvCompetencesController < ApplicationController

  def index
    @cv_competences = CvCompetence.all.order(:id)
  end

  def show
    @cv_competence = CvCompetence.find(params[:id])
  end

  def new
    @cv_competence = CvCompetence.new
  end

  def create
    @cv_competence = CvCompetence.new(cv_competence_params)
    if @cv_competence.save

      redirect_to @cv_competence
    else
      render 'new'
    end
  end

  def destroy
    @cv_competence = CvCompetence.find(params[:id])
    @cv_competence.destroy

    redirect_to cv_competences_path
  end

end

private

def cv_competence_params
  params.require(:cv_competences).permit(:title, :info, :info_two, :info_three, :info_four)
end
