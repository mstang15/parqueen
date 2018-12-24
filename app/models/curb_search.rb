class CurbSearch

  def initialize(latitude, longitude)
    @lat = latitude
    @lon = longitude
  end
  
  def endpoint_id
    "Curb Details"
  end
  
  def parking
    CurbInformation.new(parking_data)
  end

private

  def parking_data
    @parking_data ||= service.get_parking
  end

  def service
    CoordService.new(@lat, @lon)
  end
end