json.array!(@notes) do |note|
  json.extract! note, :id, :study_session_id
  json.url note_url(note, format: :json)
end
