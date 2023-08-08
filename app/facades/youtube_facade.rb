class YoutubeFacade
  def initialize(country)
    @country = country
  end

  def videos
    response = YoutubeService.get_data_by_country(@country)
    response[:items].map do |item|
    yt_hash = {
      country: @country,
      video_id: item[:id][:videoId],
      title: item[:snippet][:title],
      images: nil
    }
    vids = Youtube.new(yt_hash)
    end
  end
end