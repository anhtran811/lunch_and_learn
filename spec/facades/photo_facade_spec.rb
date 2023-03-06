require 'rails_helper'

RSpec.describe PhotoFacade do
  it 'can return a photo poro', :vcr do 
    country = "Thailand"
    images_info = PhotoFacade.get_photos(country)

    expect(images_info).to be_an(Array)
    expect(images_info.count).to eq(10)
    expect(images_info[0]).to be_a(Photo)
  end
end