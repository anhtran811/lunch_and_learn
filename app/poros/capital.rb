class Capital
  attr_reader :name,
              :longitude,
              :latitude

  def initialize(attributes)
    @name = attributes[:capital][0]
    @longitude = attributes[:capitalInfo][:latlng][1]
    @latitude = attributes[:capitalInfo][:latlng][0]
  end
end