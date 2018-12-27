require 'rails_helper'

describe Parking do
  
  describe 'Validations' do
    it { should belong_to(:user) } 
  end

  describe 'Class methods' do
    it 'can #create_from_json with recognizable coordinates' do
      good_coords_json = {
        "user_id": "MQ==",
        "curb_id": "c2Y6Mzk3OQ",
        "latitude": 37.80221017610328,
        "longitude": -122.4053808884732,
        "street_name": "Telegraph Hill Boulevard",
        "start_cross_street": "Lombard Street",
        "end_cross_street": "DEAD END",
        "side_of_street": "SW",
        "legal": true
    }

      parking = Parking.create_from_json(good_coords_json)
    
      expect(parking.user_id).to eq(1)
      expect(parking.curb_id).to eq("c2Y6Mzk3OQ")
      expect(parking.latitude).to eq(37.80221017610328)
      expect(parking.longitude).to eq(-122.4053808884732)
      expect(parking.street_name).to eq("Telegraph Hill Boulevard")
      expect(parking.start_cross_street).to eq("Lombard Street")
      expect(parking.end_cross_street).to eq("DEAD END")
      expect(parking.side_of_street).to eq("SW")
      expect(parking.legal).to eq(true)
    end
  end
end