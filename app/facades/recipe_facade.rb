class RecipeFacade
  def initialize(country)
    @country = country
  end

  def recipes
    json = RecipeService.get_recipe(@country)
    recipe_array = []
    json.each do |hit|
      rec_hash = { 
        uri: hit[:uri],
        label: hit[:label],
        country: @country,
        image: hit[:image]
      }
      recipes = Recipe.new(rec_hash)
      recipe_array << recipes
    end
    recipe_array
  end
end