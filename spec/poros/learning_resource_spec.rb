require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes', :vcr do
    country = "Thailand"

    video = {
              id: { videoId: "uw8hjVqxMXw" },
              snippet: { title: "A Super Quick History of Laos" }
            }

    images = {
                alt_description: "bird's eye view of islands",
                urls: { 
                        regular: "www.image-url.com"
                      }
              }

    resources = LearningResource.new(country, video, images)

    expect(resources.country).to eq("Thailand")
    expect(resources.video).to be_a(Hash)
    expect(resources.video[:id][:videoId]).to eq("uw8hjVqxMXw")
    expect(resources.video[:snippet][:title]).to eq("A Super Quick History of Laos")
    expect(resources.images[:alt_description]).to eq("bird's eye view of islands")
    expect(resources.images[:urls][:regular]).to eq("www.image-url.com")
  end
end