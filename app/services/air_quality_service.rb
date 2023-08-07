class AirQualityService

  def self.ninja_conn
    Faraday.new("https://api.api-ninjas.com/v1/airquality?city=")
  end

  def self.get_air_quality(country)
    response = ninja_conn.get("#{country}") do |request|
      request.params['city'] = country
    end
    json = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end