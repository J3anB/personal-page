class FormationsController < ApplicationController

  def index
    @formations = Formation.all
  end

  def show
    @formation = Formation.find(params[:id])
  end

  def new
    @formation = Formation.new
  end

  def edit
    @formation = Formation.find(params[:id])
  end

  def create
    @formation = Formation.new(formation_params)
    if @formation.save

      redirect_to @formation, notice: "Your new #{@formation.school} has been created successfully"
    else
      render 'new'
    end
  end

  def update
    @formation = Formation.find(params[:id])

    if @formation.update(formation_params)
      redirect_to @formation, notice: "Your #{@formation.school} has been updated successfully"
    else
      render 'edit'
    end
  end


  def destroy
    Formation.find(params[:id]).destroy
    redirect_to formations_path, notice: "Your formation has been deleted successfully"
  end


end

private

def formation_params
  params.require(:formation).permit(:school, :date, :content)
end