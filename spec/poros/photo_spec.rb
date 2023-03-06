require 'rails_helper'

RSpec.describe Photo do
  it 'exists and has attributes', :vcr do
    country = "Thailand"
    images = PhotoFacade.get_photos(country)
    attributes = {
                    alt_description: "bird's eye view of islands",
                    urls: { 
                            regular: "www.image-url.com"
                          }
                  }

    image = Photo.new(attributes)       

    expect(image.alt_tag).to eq("bird's eye view of islands")
    expect(image.url).to eq("www.image-url.com")
  end
end