class Youtube
  attr_reader :id,
              :type,
              :country,
              :youtube_video_id,
              :title,
              :images

  def initialize(data)
    @id = nil
    @type = "learning_resource"
    @country = data[:country]
    @youtube_video_id = data[:video_id]
    @title = data[:title]
    @images = data[:images]
  end
end