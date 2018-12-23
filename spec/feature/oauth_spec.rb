require 'rails_helper'

  context 'as a visitor' do
    it 'I can log in with google using oauth2' do
      def stub_omniauth
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({'uid'=> '1234','credentials' => {'token' => '4321'},'info' =>{'email'=> "example@gmail.com", 'name' => "John Smith"}})
      end

      stub_omniauth

      visit '/'
      click_link "Log in with Google"

      expect(page).to have_content('ParQueen')
      expect(page).to have_content('Logged in as John Smith')
      expect(current_path).to eq('/home')
    end
  end
