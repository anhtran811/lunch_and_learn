class TouristSightsFacade
  def self.tourist_sights(capital, long, lat)
    tourist_sights = GeoapifyService.get_tourist_sights(capital, long, lat)
    tourist_sights[:features].map do |sight|
      TouristSight.new(sight)
    end
  end
end