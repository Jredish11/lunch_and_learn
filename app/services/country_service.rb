class CountryService

  def self.country_conn
    Faraday.new("https://restcountries.com/v3.1/")
  end

  def self.get_country
    cache_key = "get_country_data"
    response = Rails.cache.fetch(cache_key, expires_in: 1.day) do 
      country_conn.get("all")
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
  
  # def self.get_recipes(country)
  #   response = .get("/name/#{country}")
  #   json = JSON.parse(response.body, symbolize_names: true)
  # end
end