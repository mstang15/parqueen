class ParkingFacade

	def initialize(params)
    @location = params[:location]
	end

  def parking_street
    parking.street_name
  end

  def parking_side
    parking.side_of_street
  end

  def parking_start
    parking.start_cross_street
  end

  def parking_end
    parking.end_cross_street
  end

  def parking_legal
    parking.legal
  end

private

  def parking
    data = service.get_parking
    @_parking = CurbInformation.new(data)
    # would this be where we write to the database?
  end

  def service
    CoordService.new(@location)
  end

end
