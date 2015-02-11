json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :name, :tracking_id
  json.url tracker_url(tracker, format: :json)
end
