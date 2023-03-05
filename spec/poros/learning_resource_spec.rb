require 'rails_helper'

RSpec.describe LearningResource do
  it 'exists and has attributes' do
    country = "Thailand"

    video = {
              id: { videoId: "uw8hjVqxMXw" },
              snippet: { title: "A Super Quick History of Laos" }
            }

    resources = LearningResource.new(country, video)

    expect(resources.country).to eq("Thailand")
    expect(resources.video).to be_a(Hash)
    expect(resources.video).to eq(video)
  end
end