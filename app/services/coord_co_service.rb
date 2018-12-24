class CoordCoService

	def initialize(latitude, longitude)
		@lat = latitude
		@lon = longitude
	end

	def get_parking
		to_json("/v1/search/curbs/bylocation/time_rules")
	end

private
	def to_json(url)
		JSON.parse(conn.get(url).body, symbolize_names: true)
	end

	def conn
	  Faraday.new(url: "https://api.coord.co") do |faraday|
	    faraday.params['access_key'] = ENV["COORD_TOKEN"]
	    faraday.params['latitude'] = @lat
			faraday.params['longitude'] = @lon
	    faraday.params['radius_km'] = 0.001
			faraday.adapter Faraday.default_adapter
	  end
	end
end