class YoutubeSerializer
  include JSONAPI::Serializer
  set_id :id
  attributes :country
  
  attribute :video do |yt|
    {
      title: yt.title,
      youtube_video_id: yt.youtube_video_id,
    }
  end

  attribute :images do |yt|
      {
        alt_tag: yt.alt_tag,
        url: yt.url,
      }
  end
end
