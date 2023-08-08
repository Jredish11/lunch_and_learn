require "rails_helper"

RSpec.describe ImageFacade do
  describe "instance methods" do
    describe "#images" do
      xit "pulls up images based on a country input", :vcr do
        country = "laos"

        images = ImageFacade.new(country).images

        # expect(images.count).to eq(5)
        
        # images.each do |image|

        #   expect(image).to be_a(Image)
        #   expect(image.id).to eq(nil)
        #   expect(image.type).to eq("image")
        #   expect(image.title).to be_a(String)
        #   expect(image.country).to be_a(String)
        #   expect(image.image_url).to be_a(String)
      end
    end
  end
end