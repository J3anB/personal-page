class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :verify_authenticity_token

  def index
    @cv_cards = CvCard.all
    @cv_competences = CvCompetence.all
    @formations = Formation.all
  end

end
