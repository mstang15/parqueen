class CurbSearch

  def initialize(latitude, longitude)
    @lat = latitude
    @lon = longitude
  end
  
  def endpoint_id
    "Curb Details"
  end

  def message
    "You are parked on the #{parking.side_of_street} side of #{parking.street_name} between #{parking.start_cross_street} and #{parking.end_cross_street}."
  end
  
  def parking
    CurbInformation.new(parking_data)
  end

private

  def parking_data
    @parking_data ||= service.get_parking
  end

  def service
    CoordCoService.new(@lat, @lon)
  end
end