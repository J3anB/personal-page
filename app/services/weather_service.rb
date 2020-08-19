class WeatherService

  def initialize(token)
    @token = token
  end

  def query(city_id)
    url = URI.parse("http://api.openweathermap.org/data/2.5/weather?id=#{city_id}&appid=#{@token}&units=metric")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }
    res.body
  end

  def parse_perform(raw_json)
    weather = Weather.new
    parsed_perform = JSON.parse(raw_json)
    if parsed_perform['cod'].nil?
      weather.city = parsed_perform['name']
      weather.temperature = parsed_perform['main']['temp']
      weather.humidity = parsed_perform['main']['humidity'].to_i
      weather.description = parsed_perform['weather'].first['description']
      weather.save!
    else
      Rails.logger.error('to many requests')
    end
  end

  def get_weather(city_id)
    parse_perform(query(city_id))
  end

  def self.get_last_weather
    Weather.order(created_at: :desc).first
  end

end