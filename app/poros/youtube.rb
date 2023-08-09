class Youtube
  attr_reader :id,
              :type,
              :country,
              :youtube_video_id,
              :title,
              :alt_tag,
              :url

  def initialize(country, video, images)
    @id = nil
    @type = "learning_resource"
    @country = country
    @youtube_video_id = video.map { |vid| vid[:id][:videoId] }
    @title = video.map { |vid| vid[:snippet][:title] }
    @alt_tag = images.map { |img| img[:alt_description] }
    @url = images.map { |img| img[:urls][:regular] }
  end
end