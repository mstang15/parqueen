require 'rails_helper'

xdescribe 'when a user creates a parking show page by button press' do
  it 'if parking is legal page displays location info' do
    params = {:location => "37.802756844713855,-122.40579354398695"}
    VCR.use_cassette("coords_parking_call") do
    visit parking_path(params)
    end

    expect(current_path).to eq(parking_path)
    expect(page).to have_content("YOU PARKED YOUR CHARIOT LEGALLY!")
    expect(page).to have_content("Telegraph Hill Boulevard")
    expect(page).to have_content("DEAD END")
    expect(page).to have_content("Lombard Street")
    expect(page).to have_content("NE")
  end

  it 'if parking is not legal page displays location info' do
    params = {:location => "37.79974763215206,-122.40737978313376"}
    VCR.use_cassette("coords_parking_call_illegal") do
    visit parking_path(params)
    end

    expect(current_path).to eq(parking_path)
    expect(page).to have_content("YOU CANNOT LEGALLY PARK HERE!")
    expect(page).to have_content("Grant Avenue")
    expect(page).to have_content("Green Street")
    expect(page).to have_content("Union Street")
    expect(page).to have_content("E")
  end
end

