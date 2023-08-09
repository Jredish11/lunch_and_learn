class Youtube
  attr_reader :id,
              :type,
              :country,
              :youtube_video_id,
              :title,
              :alt_tag,
              :url

  def initialize(data, country)
    @id = nil
    @type = "learning_resource"
    @country = country
    @youtube_video_id = data[:video_id]
    @title = data[:snippet][:title]
  
  end
end