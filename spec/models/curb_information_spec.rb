require 'rails_helper'

describe CurbInformation do
  it 'can be created with attributes for good coordinates' do
    attributes = {
                  :features=>[{
                    :geometry=>{
                      :coordinates=>[
                        [-122.4053808884732, 37.80221017610328]
                      ]
                    },
                    :properties=>{
                      :metadata=>{
                        :end_street_name=>"DEAD END",
                        :side_of_street=>"SW",
                        :start_street_name=>"Lombard Street",
                        :street_name=>"Telegraph Hill Boulevard"
                      },
                      :uses=>{ :use=>"park" }
                    }
                  }]
                }
                  
    curb_information = CurbInformation.new(attributes)

    expect(curb_information.street_name).to eq("Telegraph Hill Boulevard")
    expect(curb_information.start_cross_street).to eq("Lombard Street")
    expect(curb_information.end_cross_street).to eq("DEAD END")
    expect(curb_information.side_of_street).to eq("SW")
    expect(curb_information.legal).to eq(true)
  end

  it 'can be created with attributes for bad coordinates' do
    attributes = {
                  :features=>[],
                  :no_curbs_reason=>"The location you supplied is not in a city we have curb data for. To see the list of cities we support, visit https://coord.co/locations",
                  :type=>"FeatureCollection"
                }
    curb_information = CurbInformation.new(attributes)
    no_curb_reason = "The location you supplied is not in a city we have curb data for. To see the list of cities we support, visit https://coord.co/locations"

    expect(curb_information.no_curbs).to eq(no_curb_reason)
  end
end