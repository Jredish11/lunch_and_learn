class RecipeService

  def self.ede_conn
    Faraday.new("https://api.edamam.com/api/recipes/v2") 
  end

  def self.get_recipe(country)
    response = ede_conn.get("?") do |request|
      request.params['type'] = "public"
      request.params['q'] = country
      request.params['app_id'] = ENV['ede_id']
      request.params['app_key'] = ENV['ede_key']
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end