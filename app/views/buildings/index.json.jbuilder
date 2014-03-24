json.array!(@buildings) do |building|
  json.extract! building, :id, :school_id
  json.url building_url(building, format: :json)
end
