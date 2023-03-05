class PhotoFacade
  def self.get_photos(country)
    photos = UnsplashService.get_photos_by_country(country)
    photos.map do |photo|
      Photo.new(photo)
    end
  end
end