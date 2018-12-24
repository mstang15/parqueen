require 'rails_helper'

describe 'GET request' do
  describe 'user visits /api/v1/parking' do
    it 'shows curb details' do
      lat = 37.802756844713855
      lon = -122.40579354398695
      visit "/api/v1/parking?latitude=#{lat}&longitude=#{lon}"

      expect(response.status).to eq(200)

      curb_details = JSON.parse(response.body, symbolize_names: true)

      expect(curb_details).to be_a(Hash)
      expect(curb_details).to have_key(:data)
      expect(curb_details[:data]).to have_key(:message)
    end
  end
end