require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes', :vcr do
    country = "Thailand"

    video = {
              id: { videoId: "uw8hjVqxMXw" },
              snippet: { title: "A Super Quick History of Laos" }
            }

    photos = {
                alt_description: "bird's eye view of islands",
                urls: { 
                        regular: "www.image-url.com"
                      }
              }

    resources = LearningResource.new(country, video, photos)

    expect(resources.country).to eq("Thailand")
    expect(resources.video).to be_a(Hash)
    expect(resources.video[:id][:videoId]).to eq("uw8hjVqxMXw")
    expect(resources.video[:snippet][:title]).to eq("A Super Quick History of Laos")
    expect(resources.photos[:alt_description]).to eq("bird's eye view of islands")
    expect(resources.photos[:urls][:regular]).to eq("www.image-url.com")
  end
end