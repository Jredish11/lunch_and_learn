class Image
  attr_reader :id,
              :type,
              :country,
              :image_url,
              :alt_tag

  def initialize(data, country)
    @id = nil
    @type = "image"
    @country = country
    @image_url = data[:urls][:regular]
    @alt_tag = data[:alt_description]
  end
end