class CountryFacade

  def initialize(country)
    @country = country
  end
  def self.random_country
    countries = CountryService.get_country
    name = countries.map { |country| country[:name][:common] }
    name.sample
  end

  def get_capital
    countries = CountryService.get_country
    name = countries.map { |country| country[:capital].join }
  end
end