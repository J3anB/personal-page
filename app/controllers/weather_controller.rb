class WeatherController < ApplicationController
  skip_before_action :authenticate_user!

  def weather_request
    WeatherWorker.new.perform(2998324)
    render :json => WeatherService.get_last_weather
  end
end
