require 'rails_helper'

RSpec.describe Photo do
  it 'exists and has attributes', :vcr do
    country = "Thailand"
    photos = PhotoFacade.get_photos(country)
    attributes = {
                    alt_description: "bird's eye view of islands",
                    urls: { 
                            regular: "www.image-url.com"
                          }
                  }

    photo = Photo.new(attributes)       

    expect(photo.alt_tag).to eq("bird's eye view of islands")
    expect(photo.url).to eq("www.image-url.com")
  end
end