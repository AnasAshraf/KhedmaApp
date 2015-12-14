json.array!(@pending_item_requests) do |pending_item_request|
  json.extract! pending_item_request, :id
  json.url pending_item_request_url(pending_item_request, format: :json)
end
