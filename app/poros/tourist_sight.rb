class TouristSight
  attr_reader :name,
              :formatted_address,
              :place_id 

  def initialize(attributes)
    @name = attributes[:properties][:name]
    @formatted_address = attributes[:properties][:formatted]
    @place_id = attributes[:properties][:place_id]
  end
end