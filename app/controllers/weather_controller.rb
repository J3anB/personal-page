class WeatherController < ApplicationController
  skip_before_action :authenticate_user!

  def weather_request
    WeatherWorker.new.perform
    render :json => WeatherService.get_last_weather
  end

  def weather_chart_request
    render :json => WeatherService.get_all_weather
  end
end
