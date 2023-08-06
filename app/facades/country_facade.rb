class CountryFacade
  def self.random_country
    countries = CountryService.get_country
    name = countries.map { |country| country[:name][:common] }
    name.sample
  end
end