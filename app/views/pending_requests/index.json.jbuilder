json.array!(@pending_requests) do |pending_request|
  json.extract! pending_request, :id
  json.url pending_request_url(pending_request, format: :json)
end
