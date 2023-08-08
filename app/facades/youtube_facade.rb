class YoutubeFacade
  def initialize(country)
    @country = country
  end

  def videos
    response = YoutubeService.get_data_by_country(@country)
    response_image = ImageService.get_images(@country)
    vids_array = []

    require 'pry'; binding.pry
    response[:items].map do |item|
    response_image[:results].drop(1).map do |image|
        yt_hash = {
          country: @country,
          video_id: item[:id][:videoId],
          title: item[:snippet][:title],
          alt_description: image[:alt_description],
          urls: image[:urls][:regular]
        }
        vids = Youtube.new(yt_hash)
        vids_array << vids
      end
      vids_array
    end
  end
end