class PhotoFacade
  def self.get_photos(country)
    photos = UnsplashService.get_photos_by_country(country)
    if photos 
      photos.map do |photo|
        Photo.new(photo)
      end
    else
      error = {}
      Photo.new(error)
    end
  end
end