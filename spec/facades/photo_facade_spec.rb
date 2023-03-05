require 'rails_helper'

RSpec.describe PhotoFacade do
  it 'can return a photo poro', :vcr do 
    country = "Thailand"
    photos_info = PhotoFacade.get_photos(country)

    expect(photos_info).to be_an(Array)
    expect(photos_info.count).to eq(10)
    expect(photos_info[0]).to be_a(Photo)
  end
end