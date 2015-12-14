json.array!(@lendings) do |lending|
  json.extract! lending, :id
  json.url lending_url(lending, format: :json)
end
