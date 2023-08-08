require "rails_helper"

describe ImageService do
  describe "connection to Unsplash" do
    describe "#get_image(country)" do
      it "get image from the country of the youtube search", :vcr do
        country = "laos"

        image = ImageService.get_images(country)
        expect(image).to be_a(Hash)
        expect(image).to have_key(:results)
        expect(image[:results]).to be_a(Array)
        expect(image[:results].first).to have_key(:urls)
        expect(image[:results].first[:urls]).to be_a(Hash)
        expect(image[:results].first[:urls]).to have_key(:regular)
        expect(image[:results].first[:urls][:regular]).to be_a(String)
      end
    end
  end
end
