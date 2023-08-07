class CountryFacade

  # def initialize(country)
  #   @country = country
  # end
  def self.random_country
    countries = CountryService.get_country
    name = countries.map { |country| country[:name][:common] }
    name.sample
  end
 
  def self.capitals_mapping
    countries = CountryService.get_country
    capitals = {}

    countries.each do |country|
      country_name = country[:name][:common]
      capital = country[:capital].is_a?(Array) ? country[:capital].first : country[:capital]
      capitals[country_name] = capital.to_s
    end

    capitals
  end

  def self.get_capital(country_name)
    capitals = capitals_mapping
    capitals[country_name] || "Unknown Capital"
  end
   

  # def get_capital(country_name)
  #   countries = CountryService.get_country
  #   capitals = {}

  #   countries.each do |country|
  #     country_name = country[:name][:common]
  #     capital = country[:capital].is_a?(Array) ? country[:capital].first : country[:capital]
  #   # if country[:capital].is_a?(Array)
  #     # capital = country[:capital].first
  #   # else
  #   #   capital = country[:capital]
  #   # end
  #     capitals[country_name] = capital.to_s
  #   end
  #   capitals[country_name]
  # end
  

  
  
  
  
  
  
  
  
  #   countries = CountryService.get_country
  #   caps = countries.flat_map { |c| c[:capital]}
  #   capital = caps.select { |cap| cap }
  #   require 'pry'; binding.pry
  # end
    # name = coutries.map { |country| country[:capital].join 
end