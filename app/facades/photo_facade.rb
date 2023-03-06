class PhotoFacade
  def self.get_photos(country)
    photos = UnsplashService.get_photos_by_country(country)
    # require 'pry'; binding.pry
    if photos[0][:errors]
      error = []
      return error
    else
      photos.map do |photo|
        Photo.new(photo)
      end
    end
  end
end