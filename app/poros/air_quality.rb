class AirQuality
  attr_reader :country, 
              :aqi, 
              :pm25_concentration, 
              :co_concentration

  def initialize(data)
    @country = data[:city]
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:"PM2.5"]
    @co_concentration = data[:CO]
  end
end
