class YoutubeFacade
  def initialize(country)
    @country = country
  end

  def videos
    response = YoutubeService.get_data_by_country(@country)
    vids_array = []

    response[:items].map do |item|
     Youtube.new(item, @country)
    end
  end
end