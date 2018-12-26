class Api::V1::ParkingController < ApiController
  before_action :curb_details

  def show
    render json: CurbSerializer.new(curb_details).serialized_json
  end

  def create
    if no_curb_param
      render json: { message: "No data exists for this location.  Unable to save." }
    else
      parking = Parking.find_by(curb_id: curb_id_param)
      if parking
        render json: { message: "You have already saved this location." }
      else
        Parking.create(parking_params)
        render json: { message: "This location has been saved." }
      end
    end
  end

  private
  def curb_details
    @curb_details = CurbSearch.new(params[:latitude], params[:longitude])
  end

  def no_curb_param
    params[:data][:attributes][:no_curbs]
  end

  def curb_id_param
    params[:data][:attributes][:parking][:curb_id]
  end

  def parking_params
    params[:data][:attributes][:parking]
  end
end