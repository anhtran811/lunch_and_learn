class PhotoFacade
  def self.get_photos(country)
    photos = UnsplashService.get_photos_by_country(country)
    if photos.class == Hash
      return []
    else
      photos.map do |photo|
        Photo.new(photo)
      end
    end
  end
end