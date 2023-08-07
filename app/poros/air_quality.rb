class AirQuality
  attr_reader :country, 
              :aqi, 
              :pm25_concentration, 
              :co_concentration,
              :type,
              :id

  def initialize(data)
    @id = nil
    @type = "air_quality"
    @country = data[:city]
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"]
    @co_concentration = data[:CO]
  end
end
