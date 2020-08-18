class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :verify_authenticity_token

  def index
  end
end
