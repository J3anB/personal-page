class SlackConnectionController < ApplicationController

  def show

    unless slack_params[:code].nil?
      # Instantiate a web client
      client = Slack::Web::Client.new

# Request a token using the temporary code
      rc = client.oauth_v2_access(
          client_id: Rails.application.credentials.slack[:client_id],
          client_secret: Rails.application.credentials.slack[:secret_access_key],
          code: slack_params[:code]
      )

    end
  end

  private

  def slack_params
    params.permit(:code)
  end
end
