class AirQualityFacade
  # def initialize(country)
  #   @country = "United States"
  # end

  def self.air_quality(country)
    json = AirQualityService.new.get_air_quality(country)
    
    aq_hash = {
      city: country,
      overall_aqi: json[:overall_aqi],
      :"PM2.5" => json[:"PM2.5"][:concentration],
      CO: json[:CO][:concentration]
    }
    aq = AirQuality.new(aq_hash)
  end

end
