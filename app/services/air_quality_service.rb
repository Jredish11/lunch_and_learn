class AirQualityService

  def ninja_conn
    Faraday.new("https://api.api-ninjas.com/v1/airquality")
  end

  def get_air_quality(country)
    response = ninja_conn.get do |request|
      request.params['city'] = country
      request.headers['X-Api-Key'] = ENV['ninja_key']
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end