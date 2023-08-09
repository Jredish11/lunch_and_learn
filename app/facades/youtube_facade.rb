class YoutubeFacade
  def initialize(country)
    @country = country
  end

  def videos
    video_data = YoutubeService.get_data_by_country(@country)[:items].first[:id][:videoId]
    image_data = ImageService.get_images(@country)[:results]
    Youtube.new(@country, video_data, image_data)
  end
end

#     vids_array = []

#     response[:items].each do |item|
#       item.each do |i|
        
      
#         require 'pry'; binding.pry

#         response_image[:results].map do |image|
#           require 'pry'; binding.pry
#           yt_hash = {
#             country: @country,
#             video_id: item[:id][:videoId],
#             title: item[:snippet][:title],
#             alt_description: image[:alt_description],
#             urls: image[:urls][:regular]
#           }
#           vids_array << Youtube.new(yt_hash)
#           require 'pry'; binding.pry
#         end
#       end
#     end
#   end
# end

    # response[:items].map do |item|
    #   require 'pry'; binding.pry
    #   response_image[:results].drop(1).each do |image|
    #     yt_hash = {
    #       country: @country,
    #       video_id: item[:id][:videoId],
    #       title: item[:snippet][:title],
    #       alt_description: image[:alt_description],
    #       urls: image[:urls][:regular]
    #       }
    #       vids_array << Youtube.new(yt_hash)
    #   end
    # end
  
