require 'rails_helper'

describe CoordCoService do
  context 'Instance Methods' do
    it 'can #get_parking if coords are recognized' do
      VCR.use_cassette('good_coords_get_parking') do
        service = CoordCoService.new(37.8027568, -122.4057935)
        good_response = service.get_parking

        expect(good_response).to be_a(Hash)
        expect(good_response).to have_key(:features)
        expect(good_response[:features]).to be_a(Array)
        expect(good_response[:features][0]).to have_key(:geometry)
        expect(good_response[:features][0][:geometry]).to have_key(:coordinates)
        expect(good_response[:features][0][:geometry][:coordinates]).to be_a(Array)
        expect(good_response[:features][0]).to have_key(:properties)
        expect(good_response[:features][0][:properties]).to have_key(:metadata)
        expect(good_response[:features][0][:properties][:metadata]).to have_key(:curb_id)
        expect(good_response[:features][0][:properties][:metadata]).to have_key(:end_street_name)
        expect(good_response[:features][0][:properties][:metadata]).to have_key(:side_of_street)
        expect(good_response[:features][0][:properties][:metadata]).to have_key(:start_street_name)
        expect(good_response[:features][0][:properties][:metadata]).to have_key(:street_name)
        expect(good_response[:features][0][:properties]).to have_key(:uses)
        expect(good_response[:features][0][:properties][:uses]).to have_key(:use)
        expect(good_response[:features][0][:properties][:uses][:use]).to eq("park")
      end
    end

    it 'can #get_parking if coords are not recognized' do
      VCR.use_cassette('bad_coords_get_parking') do
        service = CoordCoService.new(39.7392358, -104.990251)
        bad_response = service.get_parking
        bad_response_message = "The location you supplied is not in a city we have curb data for. To see the list of cities we support, visit https://coord.co/locations"

        expect(bad_response).to be_a(Hash)
        expect(bad_response).to have_key(:features)
        expect(bad_response[:features]).to eq([])
        expect(bad_response).to have_key(:no_curbs_reason)
        expect(bad_response[:no_curbs_reason]).to eq(bad_response_message)
        expect(bad_response).to have_key(:type)
      end
    end
  end
end