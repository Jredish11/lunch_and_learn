class Recipe
  attr_reader :id,
              :type,
              :title,
              :url,
              :country,
              :image

  def initialize(data)
    @id = nil
    @type = "recipe"
    @title = data[:label]
    @url = data[:uri]
    @country = data[:country]
    @image = data[:image]
  end
end