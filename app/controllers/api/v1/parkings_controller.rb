class ParkingController < ApplicationController
  before_action :curb_details

  def show
    render json: CurbSerializer.new(curb_details)
  end

  def create
    parmas[:lat], params[:lon]
  end

  private
  def curb_details
    @curb_details ||= ParkingFacade.new(params[:lat], params[:lon])
  end
end