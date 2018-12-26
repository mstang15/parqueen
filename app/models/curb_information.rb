class CurbInformation
  attr_reader :no_curbs,
              :street_name,
              :start_cross_street,
              :end_cross_street,
              :side_of_street,
              :legal

  def initialize(data)
    set_curb_attributes(data)
  end

  def set_curb_attributes(data)
    if data[:features].empty?
      @no_curbs = data[:no_curbs_reason]
    else
      features = data[:features][0]
      @curb_id = features[:properties][:metadata][:curb_id]
      @latitude = features[:geometry][:coordinates][0][1]
      @longitude = features[:geometry][:coordinates][0][0]
      @street_name = features[:properties][:metadata][:street_name]
      @start_cross_street = features[:properties][:metadata][:start_street_name]
      @end_cross_street = features[:properties][:metadata][:end_street_name]
      @side_of_street = features[:properties][:metadata][:side_of_street]
      if features[:properties][:uses][:use] == "park"
        @legal = true
      else
        @legal = false
      end
    end
  end
end
