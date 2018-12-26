class Parking < ApplicationRecord
  belongs_to :user

  def self.create_from_json(json_data)
    Parking.create(
      curb_id: json_data[:curb_id],
      latitude: json_data[:latitude],
      longitude: json_data[:longitude],
      legal: json_data[:legal],
      street_name: json_data[:street_name],
      start_cross_street: json_data[:start_cross_street],
      end_cross_street: json_data[:end_cross_street],
      side_of_street: json_data[:side_of_street],
      user_id: Base64.decode64(json_data[:user_id])
    )
  end
end
