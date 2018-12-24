class ParkingFacade

	def initialize(params)
    @location = params[:location]
  end
  
  def parking
    CurbInformation.new(parking_data)
  end

private

  def parking_data
    @parking_data ||= service.get_parking
  end

  def service
    CoordService.new(@location)
  end

end
