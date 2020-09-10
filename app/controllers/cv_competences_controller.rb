class CvCompetencesController < ApplicationController

  def index
    @cv_competences = CvCompetence.all.order(:id)
  end

  def show
    @cv_competence = CvCompetence.find(params[:id])
  end

  def edit
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

  def update
    @cv_competence = CvCompetence.find(params[:id])

    if @cv_competence.update(cv_competence_params)
      redirect_to @cv_competence
    else
      render 'edit'
    end
  end

  def destroy
    CvCompetence.find(params[:id]).destroy
    redirect_to cv_competences_path
  end

  def info_required?(info_number)
    info_number == "one"
  end

  helper_method :info_required?

end

private

def cv_competence_params
  params.require(:cv_competence).permit(:title, :content)
end
