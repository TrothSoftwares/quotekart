json.array!(@quotes) do |quote|
  json.extract! quote, :id, :name
  json.url quote_url(quote, format: :json)
end
