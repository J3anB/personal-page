class SlackCommandController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def reply
    render :json => {'message': 'coucou petite perruche, écris ton message ici ;)'}
  end
end