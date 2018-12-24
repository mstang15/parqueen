class Api::V1::ParkingController < ApiController
  before_action :curb_details

  def show
    render json: CurbSerializer.new(curb_details).serialized_json
  end

  private
  def curb_details
    @curb_details = CurbSearch.new(params[:latitude], params[:longitude])
  end
end