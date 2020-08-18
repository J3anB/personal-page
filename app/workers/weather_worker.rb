require 'net/http'

class WeatherWorker
  include Sidekiq::Worker

  def perform(city_id)
    weather_service = WeatherService.new(Rails.application.credentials.weather[:token])
    query_response = weather_service.query(city_id)

    weather_service.parse_perform(query_response)
  end
end