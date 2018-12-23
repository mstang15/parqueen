class CurbSerializer
  include FastJsonapi::ObjectSerializer

  set_id :endpoint_id
  attributes :parking
end
