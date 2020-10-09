require 'net/http'

class WeatherWorker
  include Sidekiq::Worker

  def perform
    WeatherService.new(Rails.application.credentials.weather[:token]).get_weather(2998324)
  end

end