class CurbInformation
  attr_reader            :street_name,
                         :start_cross_street,
                         :end_cross_street,
                         :side_of_street,
                         :legal

  def initialize(data)
  @street_name        = data[:properties][:metadata][:street_name]
  @start_cross_street = data[:properties][:metadata][:start_street_name]
  @end_cross_street   = data[:properties][:metadata][:end_street_name]
  @side_of_street     = data[:properties][:metadata][:side_of_street]
    if data[:properties][:uses][:use] == "park"
      @legal          = true
    else
      @legal          = false
    end
  end
end
