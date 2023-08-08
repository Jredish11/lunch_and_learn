class YoutubeService

  def self.vid_conn
    Faraday.new("https://www.googleapis.com/youtube/v3/search")
  end

  def self.get_data_by_country(country)
    response = vid_conn.get("?") do |request|
      request.params['q'] = country
      request.params['channelId'] = "UCluQ5yInbeAkkeCndNnUhpw"
      request.params['part'] = "snippet"
      request.params['key'] = ENV['yt_key']
      request.headers['Accept'] = 'application/json'
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
end