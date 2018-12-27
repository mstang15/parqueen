require 'rails_helper'

describe 'POST request' do
  describe 'user saves curb details to /api/v1/parking' do
    it 'saves curb details to database and renders a success message' do
      curb_payload = {
          "data": {
              "id": "Curb Details",
              "type": "curb",
              "attributes": {
                  "parking": {
                      "user_id": "MQ==",
                      "curb_id": "c2Y6Mzk3OQ",
                      "latitude": 37.80221017610328,
                      "longitude": -122.4053808884732,
                      "street_name": "Telegraph Hill Boulevard",
                      "start_cross_street": "Lombard Street",
                      "end_cross_street": "DEAD END",
                      "side_of_street": "SW",
                      "legal": true
                  },
                  "message": "You are parked on the SW side of Telegraph Hill Boulevard between Lombard Street and DEAD END."
              }
          }
      }

      post '/api/v1/parking', params: curb_payload

      expect(response.status).to eq(200)

      returned_json = JSON.parse(response.body, symbolize_names: true)

      expect(returned_json[:message]).to eq("This location has been saved.")
    end

    it 'does not save duplicate curb details to database and renders an already saved message' do
    user = User.create(uid: '123', name: 'Grace Hopper', email: 'sweet@sweetness.com', google_token: 'abc123')
    curb_1 = Parking.create(user_id: user.id, curb_id: "c2Y6Mzk3OQ", latitude: 37.80221017610328, longitude: -122.4053808884732, 
                            street_name: "Telegraph Hill Boulevard", start_cross_street: "Lombard Street", end_cross_street: "DEAD END",
                            side_of_street: "SW", legal: true)
      curb_payload = {
          "data": {
              "id": "Curb Details",
              "type": "curb",
              "attributes": {
                  "parking": {
                      "user_id": "MQ==",
                      "curb_id": "c2Y6Mzk3OQ",
                      "latitude": 37.80221017610328,
                      "longitude": -122.4053808884732,
                      "street_name": "Telegraph Hill Boulevard",
                      "start_cross_street": "Lombard Street",
                      "end_cross_street": "DEAD END",
                      "side_of_street": "SW",
                      "legal": true
                  },
                  "message": "You are parked on the SW side of Telegraph Hill Boulevard between Lombard Street and DEAD END."
              }
          }
      }

      post '/api/v1/parking', params: curb_payload

      expect(response.status).to eq(400)

      returned_json = JSON.parse(response.body, symbolize_names: true)

      expect(returned_json[:message]).to eq("You have already saved this location.")
    end
  end
end