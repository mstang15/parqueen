class Api::V1::ParkingController < ApiController
  before_action :curb_details

  def show
    render json: CurbSerializer.new(curb_details).serialized_json
  end

  def create
    if params[:data][:attributes][:no_curbs]
      render json: { message: "No data exists for this location.  Unable to save." }
    else
      parking = Parking.new
      parking.create_from_json(params[:data])
    end
  end

  private
  def curb_details
    @curb_details = CurbSearch.new(params[:latitude], params[:longitude])
  end
end