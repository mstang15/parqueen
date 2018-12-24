require 'rails_helper'

describe 'GET request' do
  describe 'user visits /api/v1/parking' do
    it 'shows curb details' do
      VCR.use_cassette('get_curb_data') do
        lat = 37.802756844713855
        lon = -122.40579354398695
        get api_v1_parking_path(latitude: lat, longitude: lon)
        # get "/api/v1/parking?latitude=#{lat}&longitude=#{lon}"

        expect(response.status).to eq(200)

        returned_curb_details = JSON.parse(response.body, symbolize_names: true)

        message_result = "You are parked on the NE side of Telegraph Hill Boulevard between DEAD END and Lombard Street."
        
        expect(returned_curb_details).to be_a(Hash)
        expect(returned_curb_details).to have_key(:data)
        expect(returned_curb_details[:data]).to have_key(:attributes)
        expect(returned_curb_details[:data][:attributes]).to have_key(:parking)
        expect(returned_curb_details[:data][:attributes]).to have_key(:message)
        expect(returned_curb_details[:data][:attributes][:message]).to eq(message_result)
      end
    end

    it 'does not show curb details for unrecognized coordinates' do
      VCR.use_cassette('no_curb_data') do
        lat = 39.6729249
        lon = -104.8777542
        get api_v1_parking_path(latitude: lat, longitude: lon)
        # get "/api/v1/parking?latitude=#{lat}&longitude=#{lon}"

        expect(response.status).to eq(200)

        returned_curb_details = JSON.parse(response.body, symbolize_names: true)

        message_result = "The location you supplied is not in a city we have curb data for. To see the list of cities we support, visit https://coord.co/locations"
        
        expect(returned_curb_details).to be_a(Hash)
        expect(returned_curb_details).to have_key(:data)
        expect(returned_curb_details[:data]).to have_key(:attributes)
        expect(returned_curb_details[:data][:attributes]).to have_key(:parking)
        expect(returned_curb_details[:data][:attributes]).to have_key(:message)
        expect(returned_curb_details[:data][:attributes][:message]).to eq(message_result)
      end
    end
  end
end