class Youtube
  attr_reader :id,
              :type,
              :country,
              :youtube_video_id,
              :title,
              :alt_tag,
              :url

  def initialize(data)
    @id = nil
    @type = "learning_resource"
    @country = data[:country]
    @youtube_video_id = data[:video_id]
    @title = data[:title]
    @alt_tag = data[:alt_tag]
    @url = data[:url]
  end
end