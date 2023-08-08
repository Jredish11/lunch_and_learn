class YoutubeFacade
  def initialize(country)
    @country = country
  end

  def videos
    response = YoutubeService.get_data_by_country(@country)
    response_image = ImageService.get_images(@country)
    vids_array = []

    
    
    
    empty_array = []
    response[:items].each do |item|
      response_image[:results].each do |image|
        if response_image[:results].blank?
          empty_image_response = {
            country: @country,
            video_id: item[:id][:videoId],
            title: item[:snippet][:title],
            alt_description: image[:alt_description],
            urls: image[:urls][:regular]
            
          }
          imgs = Youtube.new(empty_image_response)
          empty_array << imgs
          end
          empty_array 
        else
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
      end
      vids_array
    end
  end
end