json.array!(@conversions) do |conversion|
  json.extract! conversion, :id, :user_agent, :host, :browser, :os, :ip_address
  json.url conversion_url(conversion, format: :json)
end
