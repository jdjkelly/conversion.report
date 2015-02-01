json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :name
  json.url tracker_url(tracker, format: :json)
end
