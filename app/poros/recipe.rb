class Recipe

  def initialize(data)
    @id = nil
    @type = 'recipe'
    @title = data[:title]
    @url = data[:url]
    @country = data[:country]
    @image_url = data[:image]
  end
end