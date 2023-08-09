class ImageService
  def self.img_conn
    Faraday.new("https://api.unsplash.com/search/photos")
  end

  def self.get_images(country)
    response = img_conn.get("?") do |request|
      request.params['query'] = country
      request.params['client_id'] = ENV['us_key']
      request.params['per_page'] = "10"
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end