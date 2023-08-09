class ImageFacade
  def initialize(country)
    @country = country
  end

  def images
    response = ImageService.get_images(@country)
    response[:results].map do |image|
      Image.new(image, @country)
    end
  end
end