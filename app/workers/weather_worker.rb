require 'net/http'

class WeatherWorker
  include Sidekiq::Worker

  def perform(city_id)
    WeatherService.new(Rails.application.credentials.weather[:token]).get_weather(city_id)
  end
end