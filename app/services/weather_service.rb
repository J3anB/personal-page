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
    weather.city = parsed_perform['name']
    weather.temperature = parsed_perform['main']['temp']
    weather.humidity = parsed_perform['main']['humidity'].to_i
    weather.description = parsed_perform['weather'].first['description']
    weather.save!
  end
end