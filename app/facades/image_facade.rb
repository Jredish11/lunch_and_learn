class ImageFacade
#   def initialize(country)
#     @country = country
#   end

#   def images
#     response = ImageService.get_images(@country)
#     yt_response = YoutubeService.get_
#     response[:results].map do |image|
#       image_hash = {
#         alt_description: image[:alt_description],
#         urls: image[:urls][:regular]
#       }
#       images = Youtube.new(image_hash)
#     end
#   end
end